require 'test_helper'

class FerpaAgreementControllerTest < ActionController::TestCase
  test "should get agreement" do
    get :agreement
    assert_response :success
  end

end
