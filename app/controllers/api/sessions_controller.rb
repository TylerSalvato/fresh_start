class Api::SessionsController < Devise::SessionsController
  protect_from_forgery with: :null_session, if: -> { request.format.json? }
  skip_before_action :verify_authenticity_token, if: -> { json_request? }

  def create
    super do |resource|
      if resource.persisted?
        render json: { success: true, user: resource.as_json }, status: :ok
      else
        render json: { success: false, errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def json_request?
    request.format.json?
  end
end
