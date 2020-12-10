class BagItemController < ApplicationController

  get '/bag' do
    redirect_if_logged_out(session)
    @user = User.find(session[:user.id])
    @bag_heads = BagItem.where(user_id: @user.id)
    erb :'bag_items/bag_items'
  end

  




end
