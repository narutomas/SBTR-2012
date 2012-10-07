# encoding: utf-8

require File.expand_path('../../test_helper', __FILE__)

class PhotosControllerTest < ActionController::TestCase
  test "shows an overview of the photos of just one contestant" do
    get :index, :duel_id => duels(:dystopia).to_param, :contestant_id => contestants(:tomas).to_param
    assert_response :ok
    assert_template 'photos/index'
  end
end
