get '/albums' do
  @albums = Album.all
  erb :albums
end

get '/album' do
  erb :album_form
end

get '/albums/:user_id' do
  @albums = Album.find_all_by_user_id(params[:user_id])
  erb :albums
end

get '/albums/:user_id/:album_id' do
  @album = Album.find_by_id(params[:album_id])
  @photos = Photo.find_all_by_album_id(params[:album_id])
  erb :photos
end

get '/albums/:album_id/:photo_id' do
  @photo = Photo.find_by_id[:photo_id]
  erb :photo
end

post '/album' do
  album = Album.new(params[:album])
  album.save
  redirect to "/albums/#{current_user.id}"
end

delete '/album/:album_id' do
  Album.find(params[:album_id]).destroy
  redirect to "/albums/#{current_user.id}"
end
