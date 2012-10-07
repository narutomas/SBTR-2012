class ContestantAssignment < ActiveRecord::Base
  belongs_to :contestant
  belongs_to :duel
  has_many :photos

  attr_accessible :contestant
end
