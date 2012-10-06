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
end
