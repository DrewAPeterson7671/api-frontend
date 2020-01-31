class HomeController < ApplicationController

  def index
    Trip.api_login
    @trips = Trip.get_locations
    render :home
  end

  def search_page
    # binding.pry
    Trip.api_login
    search_string = params[:search]

    if search_string
      @trips = Trip.search(search_string).parsed_response

    else

      @trips = nil

    end
    p @trips
    render :search_results
  end
end
