class HomeController < ApplicationController

  def landing_page
    @all_events = Event.all
  end
  
end
