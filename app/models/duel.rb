class Duel < ActiveRecord::Base
  attr_accessible :rules, :title

  validates :title, :rules, :presence => true
end
