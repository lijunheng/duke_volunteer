class OrganizationsController < ApplicationController
  def index
    @organizations = Organization.paginate(page: params[:page]).search(params[:search])
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
    @geo_location = Location.new(location_params)
    if @geo_location.save
    else
      render 'new'
    end
    @organization.location = @geo_location
    if @organization.save
    	flash[:success] = "Organization listed!"
    	redirect_to @organization
    else
      render 'new'
    end
  end

  def edit
    @organization = Organization.find(params[:id])
  end

  def update
    @organization = Organization.find(params[:id])
    if @organization.update_attributes(organization_params)
      flash[:success] = "Opportunity updated!"
      redirect_to @organization
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  	def organization_params 
  		params.require(:organization).permit(:name, :contact_information, :website, :description)
  	end

    def location_params
      params.require(:location).permit(:address)
    end
end
