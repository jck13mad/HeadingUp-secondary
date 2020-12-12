class UserController < ApplicationController

  get '/signup' do
    redirect_if_logged_in(session)
    erb :'user/signup'
  end

  post '/signup' do
    user = User.where(email: params[:user][:email])

    if !user.empty?
  end
end