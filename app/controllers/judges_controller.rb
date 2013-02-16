class JudgesController < ApplicationController
  def new
    @pair = Photo.all.sample(2)
  end
end
