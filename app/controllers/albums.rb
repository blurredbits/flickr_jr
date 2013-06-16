#list all albums
get '/albums' do
  @albums = Album.all
  erb :albums
end

get '/album' do
  erb :album_form
end

#list albums by user
get '/albums/:user_id' do
  @albums = Album.find_all_by_user_id(params[:user_id])
  erb :albums
end

#list photos in album
get '/albums/:user_id/:album_id' do
  @album = Album.find_by_id(params[:album_id])
  @photos = Photo.find_by_album_id(params[:album_id])
  erb :photos
end

#show individual photo
get '/albums/:album_id/:photo_id' do
  @photo = Photo.find_by_id[:photo_id]
  erb :photo
end

#create a new album
post '/album' do
  album = Album.new(params[:album])
  album.save
  # @albums = Album.find_by_user_id(current_user.id)
  redirect to "/albums/#{current_user.id}"
end
