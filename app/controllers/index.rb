get '/' do
  if Photo.any?
    @photo = Photo.first(:order => "RANDOM()")
  else
    @photo = 0
  end
  erb :index
end

post '/upload' do
  upload = Photo.new(params[:photo])
  upload.save
  redirect to ("/albums/#{current_user.id}/#{upload.album_id}")
end

