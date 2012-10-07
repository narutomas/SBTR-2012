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
      post :create, :duel => { :title => "dystopia", :rules => "TODO", :number_of_photos_per_contestant => 3 }
    end
    assert_redirected_to edit_duel_path(assigns(:duel))
  end

  test "sees validation errors" do
    assert_not_changes 'Duel.count' do
      post :create, :duel => {}
    end
    assert_template 'duels/new'
    assert_select 'div.field_with_errors'
  end

  test "sees an edit form with file inputs for the photos" do
    get :edit, :id => duels(:dystopia).to_param
    assert_response :ok
    assert_template 'duels/edit'
    assert_select 'form' do
      assert_select 'input[type=file]', :count => 6
    end
  end

  test "updates the metadata of the duel" do
    put :update, :id => duels(:dystopia).to_param, :duel => { :title => "Dystopia" }
    assert_equal "Dystopia", duels(:dystopia).reload.title
    assert_redirected_to edit_duel_path(duels(:dystopia))
  end

  test "sees the overview of a duel" do
    get :show, :id => duels(:dystopia).to_param
    assert_response :ok
    assert_template 'duels/show'
  end
end
