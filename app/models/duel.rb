class Duel < ActiveRecord::Base
  attr_accessible :rules, :title, :number_of_photos_per_contestant

  has_many :contestant_assignments, :autosave => true
  has_many :contestants, :through => :contestant_assignments

  validates :title, :rules, :presence => true
  validates :number_of_photos_per_contestant, :presence => true, :numericality => { :greater_than => 0 }

  before_create :assign_contestants

  private

  def assign_contestants
    Contestant.all.each do |contestant|
      contestant_assignments.build(:contestant => contestant)
    end
  end
end
