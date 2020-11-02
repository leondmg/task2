class SessionsController < ApplicationController

  def new
    if !session[:user_id].nil?
      redirect_to articles_url
    end
  end

  def create
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to (session[:intended_url] || articles_url),
                   notice: "Hi, #{user.name}"
      session[:intended_url] = nil
    else
      flash.now[:alert] = "Invalid email or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to articles_url, notice: "Signed out"
  end
end
