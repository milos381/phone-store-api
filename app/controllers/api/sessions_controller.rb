class Api::SessionsController < ApplicationController
    def create
      @user = User.find_by(username: params[:session][:username])
  
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        render json: UserSerializer.new(@user), status: :ok
      else
        render json: {
          error: "Error: Invalid Credentials"
        }
      end
    end
  
    def get_current_user
      if logged_in?
        render json: UserSerializer.new(current_user)
      else
        render json: {
          error: "Error: No one logged in"
        }
      end
    end
  
    def destroy
      session.clear
      render json: {
        notice: "Sucess!"
      }, status: :ok
    end
  
  end