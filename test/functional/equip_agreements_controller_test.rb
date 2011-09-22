require 'test_helper'

class EquipAgreementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:equip_agreements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create equip_agreement" do
    assert_difference('EquipAgreement.count') do
      post :create, :equip_agreement => { }
    end

    assert_redirected_to equip_agreement_path(assigns(:equip_agreement))
  end

  test "should show equip_agreement" do
    get :show, :id => equip_agreements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => equip_agreements(:one).to_param
    assert_response :success
  end

  test "should update equip_agreement" do
    put :update, :id => equip_agreements(:one).to_param, :equip_agreement => { }
    assert_redirected_to equip_agreement_path(assigns(:equip_agreement))
  end

  test "should destroy equip_agreement" do
    assert_difference('EquipAgreement.count', -1) do
      delete :destroy, :id => equip_agreements(:one).to_param
    end

    assert_redirected_to equip_agreements_path
  end
end
