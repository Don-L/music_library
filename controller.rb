require('sinatra')
require('sinatra/contrib/all') if development?
require('pg')
require('pry-byebug')
require_relative('models/artist')
require_relative('models/album')

#######################   ARTIST METHODS   #######################
get '/artists' do
#create
  @artists = Artist.all
  erb(:'artist/index')

end

get '/artists/new' do
#NEW
  erb(:'artist/new')

end

post '/artists' do
#INDEX
  @artist = Artist.new(params)
  @artist.save
  erb(:'artist/create') 
end

get '/artists/:id' do
#SHOW
  @artist = Artist.find(params[:id])
  @albums = Album.find_by_artist(params[:id])
  erb(:'artist/show')

end

get '/artists/:id/edit' do
#EDIT
  @artist = Artist.find(params[:id])
  erb(:'artist/edit')

end

put '/artists/:id' do
  #UPDATE
  @artist = Artist.update(params)
  redirect to("/artists/#{params[:id]}")

end

delete '/artists/:id' do
#DELETE
  Artist.eradicate(params[:id])
  redirect to('/artists')

end


#######################   ALBUM METHODS   #######################


get '/albums' do
#create
  @albums = Album.all

  erb(:'album/index')

end

get '/albums/new' do
#NEW
  @artists = Artist.all
  erb(:'album/new')

end

post '/albums' do
#INDEX
  @album = Album.new(params)
  @artist = Artist.find(@album.artist_id)
  @album.save
  erb(:'album/create') 
end

get '/albums/:id' do
#SHOW
  @album = Album.find(params[:id])
  @artist = Artist.find(@album.artist_id)
  erb(:'album/show')

end

get '/albums/:id/edit' do
#EDIT
  @album = Album.find(params[:id])
  @artist = Artist.find(@album.artist_id)
  erb(:'album/edit')

end

put '/albums/:id' do
  #UPDATE
  @album = Album.update(params)
  redirect to("/albums/#{params[:id]}")

end

delete '/albums/:id' do
#DELETE
  Album.eradicate(params[:id])
  redirect to('/albums')

end


#######################   LIBRARY METHODS   #######################


get '/library' do
#create
  @artists = Artist.all

  erb(:'library/index')

end














