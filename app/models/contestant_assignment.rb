class ContestantAssignment < ActiveRecord::Base
  has_one :contestant
  has_many :photos

  attr_accessible :contestant
end
