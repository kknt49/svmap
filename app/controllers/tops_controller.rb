class TopsController < ApplicationController
  def index
    @pictures = Picture.all

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
