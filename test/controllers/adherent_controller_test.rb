require 'test_helper'

class AdherentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get adherent_index_url
    assert_response :success
  end

  test "should get show" do
    get adherent_show_url
    assert_response :success
  end

  test "should get edit" do
    get adherent_edit_url
    assert_response :success
  end

end
