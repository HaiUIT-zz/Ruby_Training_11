class AuthController < ApplicationController
  protect_from_forgery with: :null_session
  def login
    render layout: "layouts/nomenu"
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      jwt = Auth.issue({user: authorized_user.id, permissions: authorized_user.role.permissions.to_json(except: [:id, :is_deleted])})
      render json: {jwt: jwt, status: 'ok'}
    else
      render json: {jwt: jwt, status: 'false'}	
    end
  end
end
