class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Method to check rate limit
  def rate_limit
    new_request=RequestLimit.new({ip:request.remote_ip.to_s})

    # create a new record of RequestLimit to keep count of the incomming requests
    new_request.save

    # Check if current request exceeds max limit specified

    if RequestLimit.all.size > RequestLimit::MAX_LIMIT

      # Calculate the Time till the count will get reset
      time_left=(Time.now.end_of_hour).to_i-(Time.now).to_i
      render status: 429, json: { message: "Rate limit exceeded. Try again in #{time_left} seconds" } ## response when limit is exceeded
    end
  end


end
