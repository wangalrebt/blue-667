class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  private

  def current_cart
    cart = Cart.find(session[:cart_id])
    if user_signed_in?
      if cart.users_id
        if current_user.id == cart.users_id
          return cart
        else
          return new_cart(current_user.id)
        end
      else
        cart.update_attribute(:users_id, current_user.id)
      end

    end
    cart

  rescue ActiveRecord::RecordNotFound
    if user_signed_in?
      user_id = current_user.id
      return Cart.find_all_by_users_id(user_id).last
    end
    return new_cart(user_id)
  end

  def new_cart(user_id)
    cart = Cart.create({:users_id => user_id})
    session[:cart_id] = cart.id
    cart
  end
end
