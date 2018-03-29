
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(params)
    redirect_to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :posts
  end

  get '/posts/:id' do
    @posts = Post.find(params[:id])
    binding.pry
    erb :show
  end

end
