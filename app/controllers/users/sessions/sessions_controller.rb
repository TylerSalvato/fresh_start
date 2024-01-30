# frozen_string_literal: true

#class Users::Sessions::SessionsController < Devise::SessionsController

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  class SessionsController < ApplicationController
    def create
      @admin = Admin.find_by(username: session_params[:username])
  
      if @admin && @admin.authenticate(session_params[:password])
        login!
        render json: {
          logged_in: true,
          admin: @admin
        }
      else
        render json: {
          status: 401,
          errors: ['no such admin, please try again']
        }
      end
    end
  
    def is_logged_in?
      if logged_in? && current_admin
        render json: {
          logged_in: true,
          admin: current_admin
        }
      else
        render json: {
          logged_in: false,
          message: 'no such admin'
        }
      end
    end
  
    def destroy
      logout!
      render json: {
        status: 200,
        logged_out: true
      }
    end
  
    private

    def session_params
      params.require(:admin).permit(:username, :password)
    end
  end
