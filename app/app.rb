ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'data_mapper_setup'
require 'sinatra/flash'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash

  enable :sessions
  set :session_secret, 'super secret'

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
    redirect '/users/new'
  end
  
  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
   @user = User.create(email: params[:email],
                    password: params[:password],
                    password_confirmation: params[:password_confirmation])
    if @user.save
      session[:user_id] = @user.id
      redirect to('/links')
    elsif
      @user.password != @user.password_confirmation
        flash.now[:notice] = "Sorry your passwords didn't match"
        erb :'users/new', :layout => :'users/layout'
    else
      flash.now[:notice] = "Please enter a valid email"
      erb :'users/new', :layout => :'users/layout'
    end
  end

  get '/links' do
    @links = Link.all
    erb :'links/index', :layout => :'links/layout'
  end

  post '/links' do
    link = Link.create(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to '/links'
  end

  get '/links/new' do
    erb :'links/new'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name].downcase)
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
