class HomeController < ApplicationController

  def index
    render json: {hey: "there"}
  end
end