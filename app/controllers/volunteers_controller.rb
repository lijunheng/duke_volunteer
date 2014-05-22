class VolunteersController < ApplicationController
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

  private

  	def volunteer_params 
  		params.require(:volunteer).permit(:name, :description, :host, :date, :contact)
  	end
  
end
