module Api
  module V1
    module Sessions
      class UsersSessionsController < Devise::SessionsController
        def create
          user = User.find_by(email: params[:email])
          if user && user.valid_password?(params[:password])
            token = JWT.encode({user_id: user.id}, Rails.application.secret_key_base)
            set_authorization_header token
            render json: { user: user }
          else
            render json: { error: 'Invalid email or password' }, status: :unauthorized
          end
        end


        private
        def set_authorization_header(token)
          response.headers['Authorization'] = 'Bearer ' + token
        end
      end
    end
  end
end