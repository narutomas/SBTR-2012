class Duel < ActiveRecord::Base
  attr_accessible :rules, :title, :number_of_photos_per_contestant, :contestant_assignments_attributes, :published

  has_many :contestant_assignments
  has_many :contestants, :through => :contestant_assignments

  accepts_nested_attributes_for :contestant_assignments

  scope :published, :conditions => { :published => true }

  validates :title, :rules, :presence => true
  validates :number_of_photos_per_contestant, :presence => true, :numericality => { :greater_than => 0 }

  before_create :assign_contestants_and_photos

  def previous
    id_column = self.class.arel_table[:id]
    self.class.published.where(id_column.lt(id)).order('id DESC').first
  end

  def next
    id_column = self.class.arel_table[:id]
    self.class.published.where(id_column.gt(id)).order('id ASC').first
  end

  private

  def assign_contestants_and_photos
    Contestant.all.each do |contestant|
      assignment = contestant_assignments.build
      assignment.contestant = contestant
      number_of_photos_per_contestant.times do |index|
        assignment.photos.build(:order => index+1)
      end
    end
  end
end
