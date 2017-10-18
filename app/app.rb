ENV['RACK_ENV'] ||= 'development'
require 'sinatra/base'
require_relative 'models/link.rb'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.create(url: params[:url], 
                       title: params[:title])
    tag = Tag.first_or_create(title: params[:tags])
    link.tags << tag
    link.save
    redirect '/links'
  end
end
