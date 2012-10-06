class DuelsController < ApplicationController
  def new
    @duel = Duel.new
  end
end
