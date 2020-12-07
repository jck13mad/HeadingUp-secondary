class UsersController < ApplicationController

  get '/signup' do
    redirect_if_logged_in(session)
    erb :'user/signup'
  end


  post '/signup' do
    user = User.where(email: params[:user][:email])
    # user email must be unique?
    if !user.empty?
      flash[:message] = "This email is already taken. Please pick a new one or log in."
      redirect '/signup'
    # fields cannot be empty
    elsif empty_fields?(params[:user])
      flash[:message] = "Please fill out the form."
      redirect '/signup'
    else
      user = User.new(params[:user])

      if user.save
        session[:user_id] = user.id
        redirect '/heads'
      else
        flash[:message] = "Whoops! Something went wrong. Please try again!"
        redirect '/signup'
      end
    end
  end


  get '/login' do
    redirect_if_logged_in(session)
    erb :'user/login'
  end


  post '/login' do
    if empty_fields?(params[:user])
      flash[:message] = "Umm.. Please fill out the form before submitting.."
      redirect '/login'
    else
      user = User.find_by(email: params[:user][:email])

      if user && user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect '/heads'
      else
        flash[:message] = "Wrong password or email. Please try again!"
        redirect '/login'
      end
    end
  end


  get '/logout' do
    redirect_if_logged_out(session)
    session.clear
    redirect '/heads'
  end

end