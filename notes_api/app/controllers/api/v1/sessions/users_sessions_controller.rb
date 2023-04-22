module Api
  module V1
    module Sessions
      class UsersSessionsController < Devise::SessionsController
        def create
          user = User.find_by(email: user_params[:email])
          if user && user.valid_password?(user_params[:password])
            token = JWT.encode({user_id: user.id}, Rails.application.secret_key_base)
            render json: { user: user, token: token }
          else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
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