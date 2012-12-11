require 'test_helper'

class CartsProductsControllerTest < ActionController::TestCase
  setup do
    @carts_product = carts_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carts_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carts_product" do
    assert_difference('CartsProduct.count') do
      post :create, carts_product: { cart_id: @carts_product.cart_id, product_id: @carts_product.product_id }
    end

    assert_redirected_to carts_product_path(assigns(:carts_product))
  end

  test "should show carts_product" do
    get :show, id: @carts_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carts_product
    assert_response :success
  end

  test "should update carts_product" do
    put :update, id: @carts_product, carts_product: { cart_id: @carts_product.cart_id, product_id: @carts_product.product_id }
    assert_redirected_to carts_product_path(assigns(:carts_product))
  end

  test "should destroy carts_product" do
    assert_difference('CartsProduct.count', -1) do
      delete :destroy, id: @carts_product
    end

    assert_redirected_to carts_products_path
  end
end
