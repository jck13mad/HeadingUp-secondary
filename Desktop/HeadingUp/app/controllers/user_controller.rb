class UserController < ApplicationController

  get '/signup' do
    redirect_if_logged_in(session)
    erb :'user/signup'
  end

  post '/signup' do
    user = User.where(email: params[:user][:email])

    if !user.empty?
      flash[:message] = "Email not available, please use a different email."
      redirect '/signup'
    elsif empty_fields?(params[:user])
      flash[:message] = "All fields must be filled."
      redirect '/signup'
    else
      u = User.new(params[:user])

      if u.save 
        session[:user_id] = u.id
        redirect '/all_heads'
      else
        flash[:message] = "Uh-oh, that didn't go to plan. Please try again!"
      end
    end
  end

  get '/login' do
    redirect_if_logged_in(session)
    erb :'user/login'
  end

  post '/login' do
    if empty_fields?(params[:user_id])
      flash[:message] = "All fields must be filled."
      redirect '/login'
    else
      u = User.find_by(email: params[:user][:email])

      if u && u.authenticate(params[:user][:password])
        session[:user_id] = u.id
        redirect '/all_heads'
      else
        flash[:message] = "Incorrect Email or Password. Try Again."
        redirect '/login'
      end
    end

  end

  
end