class Duel < ActiveRecord::Base
  attr_accessible :rules, :title, :number_of_photos_per_contestant, :contestant_assignments_attributes

  has_many :contestant_assignments
  has_many :contestants, :through => :contestant_assignments

  accepts_nested_attributes_for :contestant_assignments

  validates :title, :rules, :presence => true
  validates :number_of_photos_per_contestant, :presence => true, :numericality => { :greater_than => 0 }

  before_create :assign_contestants_and_photos

  private

  def assign_contestants_and_photos
    Contestant.all.each do |contestant|
      assignment = contestant_assignments.build
      assignment.contestant = contestant
      number_of_photos_per_contestant.times do
        assignment.photos.build
      end
    end
  end
end
