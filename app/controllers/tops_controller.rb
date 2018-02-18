class TopsController < ApplicationController
  def index
    @last_picture = Picture.last
    @last_num =  @last_picture.id - 1
    @picture = Picture.all
  end
end
