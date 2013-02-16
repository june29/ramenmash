class JudgesController < ApplicationController
  def new
    pair = Photo.all.sample(2)

    @first, @second = pair
  end

  def create
    winner_id = params[:winner_id]
    loser_id  = params[:loser_id]

    Judge.create(:winner_id => winner_id, :loser_id => loser_id)

    redirect_to root_path
  end
end
