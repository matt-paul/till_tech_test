require 'sinatra/base'
require './lib/order.rb'

class Cafe < Sinatra::Base

  enable :sessions
  set :views, proc { File.join(root, '..', 'views') }

  get '/' do
    erb :index
  end

  post '/receipt' do
    session[:item1] = params[:item]
    session[:qty1] = params[:quantity]
    session[:order] = Order.new
    redirect '/receipt'
  end

  get '/receipt' do
    @item1 = session[:item1]
    @qty1 = session[:qty1]
    @order = session[:order]
    @order.add_items(@item1, @qty1)
    erb :receipt
  end



  run! if app_file == $PROGRAM_NAME
end
