class PhotosController < ApplicationController
  def index
    @ranking = Judge.ranking
  end
end
