class Contestant < ActiveRecord::Base
  attr_accessible :name

  def to_param
    name.mb_chars.downcase
  end
end
