class Photo < ActiveRecord::Base
  attr_accessible :image

  belongs_to :contestant_assignment

  mount_uploader :image, ImageUploader
end
