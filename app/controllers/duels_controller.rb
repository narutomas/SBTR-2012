class DuelsController < ApplicationController
  def new
    @duel = Duel.new
  end

  def create
    @duel = Duel.new(params[:duel])
    if @duel.save
      redirect_to duel_photos_path(@duel)
    else
      render :new
    end
  end
end
