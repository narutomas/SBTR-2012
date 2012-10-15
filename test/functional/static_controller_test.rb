# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class StaticControllerTest < ActionController::TestCase
  test "sees an about page" do
    get :about
    assert_response :ok
    assert_template 'static/about'
  end
end
