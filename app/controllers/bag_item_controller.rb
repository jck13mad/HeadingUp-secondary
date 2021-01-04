class BagItemController < ApplicationController

  get '/bag' do
    redirect_if_logged_out(session)
    @user = User.find(session[:user_id])
    @bag_items = @user.bag_item.heads
    erb :'bag_items/bag_items'
  end

  get '/bag/:id' do
      @bag_item = Head.find_by_id(params[:id])
      erb :'bag_items/item' 
  end

  post '/add' do
    @user = User.find(session[:user_id])
    @head = Head.new(bag_item_id: @user.bag_item.id, img: params[:head][:img], description: params[:head][:description], price: params[:head][:price], brand: params[:head][:brand], name: params[:head][:name], quantity: params[:head][:quantity])
  
    if session[:user_id] == params[:bag][:user_id].to_i && @head.save
      redirect '/bag'
    else
      redirect '/heads'
    end
  end

  get '/bag/:id/edit' do
    @bag_item = Head.find_by_id(params[:id])

    erb :'bag_items/edit'
  end

  put '/bag/:id' do 
    @bag_item = Head.find_by_id(params[:id])
    

    # if empty_fields?(params[:quantity].to_i)
    #   env['x-rack.flash'][:notice] = "Please specify how many!"

    #   redirect '/bag/:bag_item_id/edit'
    # else
      @bag_item.update(quantity: params[:head][:quantity])
    # end
    redirect '/bag'
  end

  delete '/delete/:id' do
    @head = Head.find_by_id(params[:id])
    @head.delete

    redirect '/bag'
  end


end
