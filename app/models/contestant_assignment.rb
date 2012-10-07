class ContestantAssignment < ActiveRecord::Base
  attr_accessible :photos_attributes

  belongs_to :contestant
  belongs_to :duel
  has_many :photos

  accepts_nested_attributes_for :photos
end
