
class AuthController < ApplicationController
    def sign_up
      user = User.new(user_params)
      if user.save
        render json: { token: generate_token(user.id) }
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def sign_in
      user = User.find_by(email: params[:email])
      if user&.authenticate(params[:password])
        render json: { token: generate_token(user.id) }
      else
        render json: { error: 'Invalid email or password' }, status: :unauthorized
      end
    end
  
    private
  
    def generate_token(user_id)
      JWT.encode({ user_id: user_id }, Rails.application.secrets.secret_key_base, 'HS256')
    end
  
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end
  end
  