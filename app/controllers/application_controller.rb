
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts/new' do
    erb :index
  end

  post '/posts' do
    Post.create(params)
    redirect_to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end
end
