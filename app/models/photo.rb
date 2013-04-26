class Photo < ActiveRecord::Base
  attr_accessible :image, :order

  belongs_to :contestant_assignment

  mount_uploader :image, ImageUploader
end
