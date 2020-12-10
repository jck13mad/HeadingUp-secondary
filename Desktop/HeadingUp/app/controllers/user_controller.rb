class UserController < ApplicationController

  get '/signup' do
    redirect_if_logged_in(session)
    erb :'user/signup'
  end
end