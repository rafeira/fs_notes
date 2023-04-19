class UsersSessionsController < Devise::SessionsController
  def create
    super { |resource| @resource = resource }
  end
end