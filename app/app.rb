ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:title], tags: [Tag.create(title: params[:tags])])
    redirect '/links'
  end
end
