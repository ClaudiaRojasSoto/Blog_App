class Api::SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create], if: -> { request.format.json? }

  def create
    user = User.find_by(email: session_params[:email])
    if user&.valid_password?(session_params[:password])
      token = generate_jwt_token(user)
      user.update(api_token: token)
      render json: { api_token: token, message: 'Login successful' }
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def generate_jwt_token(user)
    payload = { user_id: user.id, exp: 24.hours.from_now.to_i }
    JWT.encode(payload, Rails.application.secret_key_base)
  end

  def session_params
    params.permit(:email, :password)
  end
end
