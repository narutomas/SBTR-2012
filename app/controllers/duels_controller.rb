class DuelsController < ApplicationController
  def new
    @duel = Duel.new
  end

  def create
    @duel = Duel.create(params[:duel])
    redirect_to duel_path(@duel)
  end
end
