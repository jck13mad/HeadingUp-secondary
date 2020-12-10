
class ApplicationController < Sinatra::Base

  # set :views, -> { File.join(root, '../views')}

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  def current_user(session)
    User.find(session_hash[:user_id])
  end

  def logged_in?(session)
    !!session[:user_id]
  end

  def redirect_if_logged_out(session)
    if !logged_in?(session)
      redirect '/heads'
    end
  end


  get '/' do
     erb :'home'
  end

end