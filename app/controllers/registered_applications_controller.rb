class RegisteredApplicationsController < ApplicationController

  def index
    @registered_applications = RegisteredApplication.all
  end

  def show
    @registered_application = RegisteredApplication.find(params[:id])
    @events = @registered_application.events.group_by(&:name)
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def edit
    @registered_application = RegisteredApplication.find(params[:id])
  end

  def create
    @registered_application = RegisteredApplication.new(registered_application_params)
    if @registered_application.save
      flash[:notice] = "Saved successfully."
      redirect_to @registered_application
    else
      flash[:alert] = "There was an error saving.  Please try again."
      render :new
    end
  end

  def destroy
    @registered_application = RegisteredApplication.find(params[:id])
    if @registered_application.destroy
      flash[:notice] = "\"#{@registered_application.name}\" was deleted successfully."
      redirect_to root_path
    else
      flash.now[:alert] = "There was an error deleting the wiki entry."
      render :show
    end
  end

  def update
    @registered_application = RegisteredApplication.find(params[:id])
    @registered_application.assign_attributes(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Entry was updated successfully."
      redirect_to [@registered_application]
    else
      flash.now[:alert] = "There was an error saving the entry. Please try again."
      render :edit
    end
  end

  private

  def registered_application_params
    params.require(:registered_application).permit(:id, :name, :url)
  end

end
