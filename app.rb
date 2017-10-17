require 'sinatra/base'
require './app/models/link.rb'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

end
