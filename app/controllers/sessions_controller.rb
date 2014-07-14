class SessionsController < ApplicationController

  def new
  end

  def create
    render 'new'
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      # sign the user in
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
