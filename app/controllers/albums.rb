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
  @albums = Albums.find_by_id(params[:user_id])
  erb :albums
end

#create a new album
post '/album' do
album = Album.new(params[:album])
album.save
redirect to '/albums'
end
