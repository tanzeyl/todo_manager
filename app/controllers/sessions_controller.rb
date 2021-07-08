class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render plain: "Successful SignIn."
    else
      render plain: "Try again."
    end
  end

end
