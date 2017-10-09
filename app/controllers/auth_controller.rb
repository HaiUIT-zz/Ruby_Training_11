class AuthController < ApplicationController
  def login
    render layout: "layouts/nomenu"
  end

  def login_attempt
    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])
    if authorized_user
      flash[:notice] = "Wow Welcome again, you logged in as #{authorized_user.username}"
      redirect_to(action: 'book#index')
    else
      flash[:notice] = "Invalid Username or Password"
      flash[:color] = "invalid"
      render action: "login", layout: "layouts/nomenu"	
    end
  end
end
