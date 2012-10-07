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
    @duel = Duel.new
  end

  test "by default assigns all contestants on create" do
    @duel.save(:validate => false)
    assert_equal @duel.contestant_assignments.map(&:contestant), contestants(:jeru, :tomas)
    assert_equal @duel.contestants, contestants(:jeru, :tomas)
  end
end
