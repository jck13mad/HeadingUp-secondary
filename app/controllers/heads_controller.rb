class HeadsController < ApplicationController
  
  get '/heads' do
    @name = "All Heads"
    @heads = Head.all
    erb :'heads/all_heads'
    # "hello world"
  end

  get '/heads/men' do
    @name = "Men's Heads"
    @heads = Head.where(gender: "men")
    erb :'heads/all_heads'
  end

  get '/heads/women' do
    @name = "Women's Heads"
    @heads = Head.where(gender: "women")
    erb :'heads/all_heads'
  end

  get '/heads/men/nike' do
    @name = "Men's Nike Heads"
    @heads = Head.where(gender: "men", brand: "Nike")
    erb :'heads/all_heads'
  end

  get '/heads/men/underarmour' do
    @name = "Men's Under Armour Heads"
    @heads = Head.where(gender: "men", brand: "Under Armour")
    erb :'heads/all_heads'
  end

  get '/heads/men/brine' do
    @name = "Men's Brine Heads"
    @heads = Head.where(gender: "men", brand: "Brine")
    erb :'heads/all_heads'
  end

  get '/heads/men/stx' do
    @name = "Men's STX Heads"
    @heads = Head.where(gender: "men", brand: "STX")
    erb :'heads/all_heads'
  end

  get '/heads/men/maverik' do
    @name = "Men's Maverik Heads"
    @heads = Head.where(gender: "men", brand: "Maverik")
    erb :'heads/all_heads'
  end

  get '/heads/men/ecd' do
    @name = "Men's ECD Lacrosse Heads"
    @heads = Head.where(gender: "men", brand: "ECD Lacrosse")
    erb :'heads/all_heads'
  end

  get '/heads/men/stringking' do
    @name = "Men's StringKing Head"
    @heads = Head.where(gender: "men", brand: "StringKing")
    erb :'heads/all_heads'
  end

  get '/heads/men/warrior' do
    @name = "Men's Warrior Heads"
    @heads = Head.where(gender: "men", brand: "Warrior")
    erb :'heads/all_heads'
  end

  get '/heads/women/brine' do
    @name = "Women's Brine Heads"
    @heads = Head.where(gender: "women", brand: "Brine")
    erb :'heads/all_heads'
  end

  get '/heads/women/ecd' do
    @name = "Women's ECD Lacrosse Heads"
    @heads = Head.where(gender: "women", brand: "ECD Lacrosse")
    erb :'heads/all_heads'
  end

  get '/heads/women/stringking' do
    @name = "Women's StringKing Heads"
    @heads = Head.where(gender: "women", brand: "StringKing")
    erb :'heads/all_heads'
  end

  get '/heads/women/stx' do
    @name = "Women's STX Heads"
    @heads = Head.where(gender: "women", brand: "STX")
    erb :'heads/all_heads'
  end

  get '/heads/women/underarmour' do
    @name = "Women's Under Armour Heads"
    @heads = Head.where(gender: "women", brand: "Under Armour")
    erb :'heads/all_heads'
  end

  get '/heads/women/epoch' do
    @name = "Women's Epoch Heads"
    @heads = Head.where(gender: "women", brand: "Epoch")
    erb :'heads/all_heads'
  end

end
