module Users
  class UsersController < ApplicationController
    def create
      user = Users::User.new(user_params)
      user.score = 0
      if user.save
        set_user_cookie(user.id)
        render json: user
      else
        render json: {errors: user.errors.full_messages},status: :conflict
      end
    end

    def index
      users = Users::User.all
      render json: users
    end
    def update_score
      user = Users::User.find(update_user_params[:user_id])
      if user.score < update_user_params[:score].to_i
        user.update(score: update_user_params[:score])
      end
    end
    def set_user_cookie(user_id)
      cookies[:user] = {
        value: user_id,
        expires: 20.years.from_now,
        same_site: :none, # Required for cross-origin requests
        secure: false, # Ensure it's secure only in production (uses HTTPS)
        domain: '.testpuzzle.ge', # Allow cookie across subdomains
        path: '/', # Cookie accessible throughout the app
        httponly: true # Ensures the cookie isn't accessible via JavaScript
      }
    end
    def get_cookie
      user = cookies[:user]
      render json: user
    end
    private
    def user_params
      params.permit(:username)
    end

    def update_user_params
      params.permit(:user_id,:score)
    end
  end
end