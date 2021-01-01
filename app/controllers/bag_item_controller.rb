class BagItemController < ApplicationController

  get '/bag' do
    redirect_if_logged_out(session)
    @user = User.find(session[:user_id])
    @bag_items = BagItem.where(user_id: @user.id)
    erb :'bag_items/bag_items'
  end

  get '/bag/:head_id' do
      @bag_item = BagItem.find_by(params[:head_id])
      erb :'bag_items/item' 
  end

  post '/add' do
    b = BagItem.new(params[:bag])

    if session[:user_id] == params[:bag][:user_id].to_i && b.save
      redirect '/bag'
    else
      redirect '/heads'
    end
  end

  get '/bag/:head_id/edit' do
    @bag_item = BagItem.find_by(params[:head_id])

     @bag_item.update(quantity: params[:quantity])

    erb :'bag_items/edit'
  end

  put '/bag/:head_id' do 
    @bag_item = BagItem.find_by(head_id: params[:head_id])
    

    # if empty_fields?(params[:quantity].to_i)
    #   env['x-rack.flash'][:notice] = "Please specify how many!"

    #   redirect '/bag/:head_id/edit'
    # else
      #@bag_item.update(quantity: params[:quantity])
    # end
    redirect '/bag'
  end

  delete '/delete/:head_id' do
    @bag_item = BagItem.find_by(params[:head_id])
    @bag_item.destroy

    redirect '/bag'
  end


end
