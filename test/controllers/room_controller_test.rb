require "test_helper"

class RoomControllerTest < ActionController::TestCase
  test "should get FamilyRoom" do
    get :FamilyRoom
    assert_response :success
  end

  test "should get Sauna" do
    get :Sauna
    assert_response :success
  end

end
