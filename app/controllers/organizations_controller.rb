class OrganizationsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @organizations = Organization.search(params[:search]).order(sort_column + " " + sort_direction)
    if params[:tag]
      @organizations = @organizations.select {|o| o.tag_list.include? params[:tag]}
    end
    @organizations = @organizations.paginate(page: params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @organizations.to_csv }
      format.xls { send_data @organizations.to_csv(col_sep: "\t") }
    end
  end

  def new
  	@organization = Organization.new
    @geo_location = Location.new
  end

  def show
  	@organization = Organization.find(params[:id])
    @volunteers = @organization.volunteers.paginate(page: params[:page])
    @location = Location.find_by(id: @organization.location)
  end

  def create
   	@organization = Organization.new(organization_params)
    @geo_location = Location.create(address: @organization.address)
    if @geo_location.save
      @organization.location = @geo_location
      @organization.distance = @geo_location.distance_to("Duke University West Campus, Durham, NC")
    end
    if @organization.save
      flash[:success] = "Organization listed!"
      redirect_to @organization
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
    @geo_location = @organization.location
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      @geo_location = Location.create(address: @organization.address)
      if @geo_location.save
        @organization.location = @geo_location
        @organization.distance = @geo_location.distance_to("Duke University West Campus, Durham, NC")
      else
        @organization.location = nil
        @organization.distance = nil
      end
      @organization.save!
      flash[:success] = "Organization updated!"
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def destroy
    Organization.find(params[:id]).destroy
    flash[:success] = "Listing removed."
    redirect_to root_path
  end

  private

  	def organization_params 
  		params.require(:organization).permit(:name, :contact_information, :website, :address, :description, :apply, :tag_list)
  	end

    def location_params
      params.require(:location).permit(:address)
    end

    def sort_column
      Organization.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
