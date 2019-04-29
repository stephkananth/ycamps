# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to home_path, notice: 'Logged in!'
    else
      flash[:error] = 'Username and/or password is invalid'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Logged out!'
  end
end
