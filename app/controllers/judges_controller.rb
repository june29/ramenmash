class JudgesController < ApplicationController
  def show
    @judge = Judge.find(params[:id])
    @first, @second = Photo.exclude(@judge.winner.id).sample(2)
  end

  def new
    @first, @second = Photo.all.sample(2)
  end

  def create
    winner_id = params[:winner_id]
    loser_id  = params[:loser_id]

    judge = Judge.create(:winner_id => winner_id, :loser_id => loser_id)

    redirect_to judge
  end
end
