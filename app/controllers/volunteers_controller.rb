class VolunteersController < ApplicationController
  
  def index
    @volunteers = Volunteer.paginate(page: params[:page])
  end

  def new
  	@volunteer = Volunteer.new
  end

  def show
  	@volunteer = Volunteer.find(params[:id])
  end

  def create
   	@volunteer = Volunteer.new(volunteer_params)
   	@volunteer.active = true
    if @volunteer.save
    	flash[:success] = "Opportunity created!"
    	redirect_to @volunteer
    else
      render 'new'
    end
  end

  def edit
    @volunteer = Volunteer.find(params[:id])
    if @volunteer.update_attributes(volunteer_params)
      flash[:success] = "Opportunity updated!"
      redirect_to @volunteer
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  	def volunteer_params 
  		params.require(:volunteer).permit(:name, :description, :host, :date, :contact)
  	end
  
end
