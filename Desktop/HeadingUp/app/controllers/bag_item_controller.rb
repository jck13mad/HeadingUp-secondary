class BagItemController < ApplicationController

  get '/bag' do
    redirect_if_logged_out(session)
    @user = User.find(session[:user.id])
    @bag_items = BagItem.where(user_id: @user.id)
    erb :'bag_items/bag_items'
  end

  post '/add' do
    b = BagItem.new(params[:bag])

    if session[:user_id] == params[:bag][:user_id].to_i && b.save
      redirect '/bag'
    else
      redirect '/heads'
    end
  end

  post '/bag/edit' do
    bag_item = BagItem.find_by(user_id: params[:bag][:user_id], head_id: params[:bag][:head_id])
    bag_item.update(quantity: params[:bag][:quantity])

    redirect '/bag'
  end

  post '/delete' do
    bag_item = BagItem.find_by(user_id: params[:bag][:user_id], head_id: params[:bag][:head_id])
    bag_item.delete

    redirect '/bag'
  end


end
