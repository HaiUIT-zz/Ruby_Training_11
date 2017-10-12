class AuthController < ApplicationController
  protect_from_forgery with: :null_session
  # render login page
  def login
    render 'login', layout: 'layouts/nomenu'
  end

  # do user login
  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      jwt = Auth.issue({user: authorized_user.id, permissions: authorized_user.role.permissions.to_json(except: [:id, :is_deleted])})
      cookies[:jwt] = generate_cookies(jwt, params[:login_remember])
      redirect_to controller: 'books', action: 'index'
    else
      flash.now[:error] = {msg: 'Wrong user id or password!'}
      render 'login', layout: 'layouts/nomenu'
    end
  end

  private

  def generate_cookies(jwt, login_remember)
    if jwt && login_remember
      { value: jwt, expires: Time.current + 1.week, httponly: true }
    else
      { value: jwt, httponly: true }
    end 
  end
end
