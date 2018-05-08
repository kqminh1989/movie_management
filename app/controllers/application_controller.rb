class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  
  def send_data (status: true, data: {}, message: {})
  	{
  		status:  status,
  		data:    data,
  		message: message
  	}
  end
end
