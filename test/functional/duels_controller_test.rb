# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class DuelsControllerTest < ActionController::TestCase
  test "sees a new duel form" do
    get :new
    assert_response :ok
    assert_template 'duels/new'
    assert_select 'form'
  end
end
