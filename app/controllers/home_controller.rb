class HomeController < ApplicationController

  # Calls the method to check the rate limit before calling Index
  before_action :rate_limit


  def index
    # Renders OK message signifying rate limit not exceeded
    render status: 200, json: { message: 'ok' }
  end
end
