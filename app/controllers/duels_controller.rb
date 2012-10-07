class DuelsController < ApplicationController
  def new
    @duel = Duel.new
  end

  def create
    @duel = Duel.new(params[:duel])
    if @duel.save
      redirect_to edit_duel_path(@duel)
    else
      render :new
    end
  end

  def edit
    @duel = Duel.find(params[:id])
  end

  def update
    @duel = Duel.find(params[:id])
    if @duel.update_attributes(params[:duel])
      redirect_to edit_duel_path(@duel)
    end
  end

  def show
    @duel = Duel.find(params[:id])
  end
end
