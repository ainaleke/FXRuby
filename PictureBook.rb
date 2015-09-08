require 'fox16'
include Fox


class PictureBook < FXMainWindow
 def initialize(app)
   super(app,"Sample PictureBook", :width=> 400, :height=> 200)
   photos = Photo.new("r.jpg")
   photo_view = PhotoView.new(self, photos)
 end
end

class PhotoView < FXImageFrame
  def initialize(p, photo)
  #We'll add code here soon
  super(p,nil)
  end

  def load_image(path)
    File.open(path,"rb") do |io| #the first arg implies that the path to the image will be placed
      #the second argument rb, implies r-read a file while b implies binary data is to be read form the disk
      self.image = FXJPGImage.new(app, io.read)
    end
  end
end


class Photo
  attr_reader :path #get methods for the path

  def initialize(path)
    @path=path #create an instance variable which takes in the users input
  end

end

app=FXApp.new
PictureBook.new(app)
#main.show(PLACEMENT_SCREEN)
app.create
app.show
app.run
