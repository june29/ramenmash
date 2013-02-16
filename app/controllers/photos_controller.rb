class PhotosController < ApplicationController
  def index
    @ranking = Judge.ranking.select {|entry|
      entry[:rate] > Judge::INITIAL_RATE
    }
  end
end
