class TopsController < ApplicationController
  def index
    @pictures = Picture.all
  end
end
