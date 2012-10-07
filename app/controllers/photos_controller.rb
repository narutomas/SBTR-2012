# encoding: utf-8
# 
class PhotosController < ApplicationController
  def index
    @duel = Duel.find(params[:duel_id])
  end
end
