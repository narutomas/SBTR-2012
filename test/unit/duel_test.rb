# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class DuelValidationTest < ActiveSupport::TestCase
  setup do
    @duel = Duel.new
  end

  test "requires a title" do
    assert_not_validates_with @duel, :title, nil
    assert_not_validates_with @duel, :title, " "
    assert_validates_with @duel, :title, "dystopia"
  end

  test "requires rules" do
    assert_not_validates_with @duel, :rules, nil
    assert_not_validates_with @duel, :rules, " "
    assert_validates_with @duel, :rules, "TODO"
  end

  test "requires an amount of photos per contestant" do
    assert_not_validates_with @duel, :number_of_photos_per_contestant, nil
    assert_not_validates_with @duel, :number_of_photos_per_contestant, 0
    assert_validates_with @duel, :number_of_photos_per_contestant, 3
  end
end

class DuelAssociationTest < ActiveSupport::TestCase
  setup do
    @duel = Duel.new(:number_of_photos_per_contestant => 3)
  end

  test "by default assigns all contestants on create" do
    assert_changes 'ContestantAssignment.count', +2 do
      @duel.save(:validate => false)
    end
    assert_equal @duel.contestant_assignments.map(&:contestant), contestants(:jeru, :tomas)
    assert_equal @duel.contestants, contestants(:jeru, :tomas)
  end

  test "creates the amount of photo records required on create" do
    assert_changes 'Photo.count', +6 do
      @duel.save(:validate => false)
    end
    @duel.contestant_assignments.each do |ca|
      assert_equal 3, ca.photos.count
    end
  end
end

class DuelTest < ActiveSupport::TestCase
  setup do
    @duel = Duel.new(:number_of_photos_per_contestant => 3)
  end

  test "is not published by default" do
    @duel.save(:validate => false)
    assert !Duel.published.include?(@duel)
    @duel.update_attribute(:published, true)
    assert Duel.published.include?(@duel)
  end

  test "returns the previous duel, if there is one" do
    assert_nil duels(:dystopia).previous
    @duel.published = true
    @duel.save(:validate => false)
    assert_equal duels(:dystopia), @duel.previous
  end

  test "returns the next duel, if there is one" do
    @duel.save(:validate => false)
    assert_nil duels(:dystopia).next
    @duel.update_attribute(:published, true)
    assert_equal @duel, duels(:dystopia).next
  end
end
