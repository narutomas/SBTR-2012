# encoding: utf-8

class PhotosController < ApplicationController
  def index
    @duel = Duel.find(params[:duel_id])
    @contestant_assignment = @duel.contestant_assignments.find do |ca|
      ca.contestant.to_param == params[:contestant_id]
    end
    # TODO send 404 if no assigment is found
  end
end
