require 'test_helper'

class LaserAgreementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:laser_agreements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create laser_agreement" do
    assert_difference('LaserAgreement.count') do
      post :create, :laser_agreement => { }
    end

    assert_redirected_to laser_agreement_path(assigns(:laser_agreement))
  end

  test "should show laser_agreement" do
    get :show, :id => laser_agreements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => laser_agreements(:one).to_param
    assert_response :success
  end

  test "should update laser_agreement" do
    put :update, :id => laser_agreements(:one).to_param, :laser_agreement => { }
    assert_redirected_to laser_agreement_path(assigns(:laser_agreement))
  end

  test "should destroy laser_agreement" do
    assert_difference('LaserAgreement.count', -1) do
      delete :destroy, :id => laser_agreements(:one).to_param
    end

    assert_redirected_to laser_agreements_path
  end
end
