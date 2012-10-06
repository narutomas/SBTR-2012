# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class DuelsControllerTest < ActionController::TestCase
  test "sees a new duel form" do
    get :new
    assert_response :ok
    assert_template 'duels/new'
    assert_select 'form'
  end

  test "creates a new duel" do
    assert_changes 'Duel.count', +1 do
      post :create, :duel => { :title => "dystopia", :rules => "TODO" }
    end
    assert_redirected_to duel_path(assigns(:duel))
  end
end
