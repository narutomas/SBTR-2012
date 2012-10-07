# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class PhotosControllerTest < ActionController::TestCase
  test "sees a form for the amount of photos each contestant should upload" do
    get :index, :duel_id => duels(:dystopia).to_param
    assert_response :ok
    assert_template 'photos/index'
    assert_select 'form' do
      assert_select 'input[type=file]', :count => 6
    end
  end
end
