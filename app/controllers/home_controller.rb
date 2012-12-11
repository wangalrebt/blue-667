class HomeController < ApplicationController
  def index
    @products = Product.where("product_type = 1")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end
  def about_us
  end
end
