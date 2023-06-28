class ApplicationController < ActionController::API
  before_action :ensure_json_request
  include ActionController::MimeResponds
  respond_to :json
  before_action :authenticate_user!, :set_user

  private
    def ensure_json_request
      return if /vnd.api\+json/.match?(request.headers['Accept'])

      render json: '', status: :not_acceptable
    end

    def set_user
      token = request.headers.fetch('Authorization').split.last
      jwt_key = Rails.application.credentials.fetch(:devise_jwt_secret_key)
      payload = JWT.decode(token, jwt_key).first
      @user = User.find(payload['sub'])
    end
end
