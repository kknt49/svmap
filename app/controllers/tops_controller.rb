class TopsController < ApplicationController
  def index
    @pictures = Picture.all

#    gon.data = @pictures
    
#    @pictures_j = @pictures.to_json.html_safe
    
#    for i in 0..@pictures.length - 1 do
#      gon.cate[i] = @pictures[i].cate
#      gon.lat[i] = @pictures[i].lat
#      gon.lon[i] = @pictures[i].lon
#      gon.image[i] = @pictures[i].image_url
#      gon.id[i] = @pictures[i].id
#    end
    

    
    @cate = []
    @lat = []
    @lon = []
    @image = []
    @id = []



    for i in 0..@pictures.length - 1 do
      @lat[i] = @pictures[i].lat
      @lon[i] = @pictures[i].lon

      @id[i] = @pictures[i].id

      @cate[i] = @pictures[i].cate

      @image[i] = @pictures[i].image_url

    end  

      @cate_j = @cate.to_json.html_safe 
      @image_j = @image.to_json.html_safe

  end


end
