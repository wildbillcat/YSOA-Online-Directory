require 'test_helper'

class PrintAgreementsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:print_agreements)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create print_agreement" do
    assert_difference('PrintAgreement.count') do
      post :create, :print_agreement => { }
    end

    assert_redirected_to print_agreement_path(assigns(:print_agreement))
  end

  test "should show print_agreement" do
    get :show, :id => print_agreements(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => print_agreements(:one).to_param
    assert_response :success
  end

  test "should update print_agreement" do
    put :update, :id => print_agreements(:one).to_param, :print_agreement => { }
    assert_redirected_to print_agreement_path(assigns(:print_agreement))
  end

  test "should destroy print_agreement" do
    assert_difference('PrintAgreement.count', -1) do
      delete :destroy, :id => print_agreements(:one).to_param
    end

    assert_redirected_to print_agreements_path
  end
end
