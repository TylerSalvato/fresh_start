# app/controllers/api/sessions_controller.rb

class Api::SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token # Only if you are using API and want to skip CSRF token check
  
    respond_to :json
  
    def create
      super do |resource|
        return render json: { success: true, user: resource.as_json }, status: :ok if resource.persisted?
        return render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end
  