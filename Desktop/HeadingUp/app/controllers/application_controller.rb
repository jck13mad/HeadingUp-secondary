
class ApplicationController < Sinatra::Base

  # set :views, -> { File.join(root, '../views')}

  configure do
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'secret'
  end

  



  get '/' do
     erb :'home'
  end

end