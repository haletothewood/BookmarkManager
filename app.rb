require 'sinatra'

class BookmarkManager < Sinatra::Base

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

end
