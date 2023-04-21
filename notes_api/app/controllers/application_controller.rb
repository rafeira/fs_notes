class ApplicationController < ActionController::API
  before_action :ensure_json_request
  include ActionController::MimeResponds
  respond_to :json


  def ensure_json_request
    return if /vnd.api\+json/.match?(request.headers['Accept'])

    render json: '', status: :not_acceptable
  end
end
