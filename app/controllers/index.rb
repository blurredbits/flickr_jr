get '/' do
  if Photo.any?
    @photos = Photo.all
  else
    @photos = 0
  end
  erb :index
end

post '/upload' do
  upload = Photo.new
  upload.album_id = params[:album_id]
  upload.title = params[:title]
  upload.file = params[:image]
  upload.save
  redirect to ('/')
end

