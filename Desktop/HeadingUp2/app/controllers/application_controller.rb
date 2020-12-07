require 'rack-flash'

class ApplicationController < Sinatra::Base
  use Rack::Flash

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

  def empty_fields?(hash)
    hash.values.any? {|x| x.nil? || x.empty?}
  end

  def redirect_if_logged_in(session)
    if logged_in?(session)
      redirect '/heads'
    end
  end

  get '/' do
    erb :'layout'
  end

end
