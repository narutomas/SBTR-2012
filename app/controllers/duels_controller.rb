class DuelsController < ApplicationController
  before_filter :block_access, :except => [:show, :latest]

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
    @duel = Duel.published.find(params[:id])
  end

  def latest
    @duel = Duel.published.order('id DESC').limit(1).first
    redirect_to duel_url(@duel)
  end
end
