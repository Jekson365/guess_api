class ApplicationController < ActionController::Base
  def auth_api_key
    api_key = request.headers['X-API-KEY']
    unless api_key && api_key == ENV['API_KEY']
      render json: { error: "Unauthorized!", status: :unauthorized }
    end
  end
end