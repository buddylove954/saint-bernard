class HomeController < ApplicationController

  def index
  	@patients = Patient.all
    render :index
  end

  def show
  	@patient = Patient.find(params[:id])
  	@facility = Facility.first
    render :show
  end
end