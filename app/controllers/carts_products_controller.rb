class CartsProductsController < ApplicationController
  before_filter :get_cart
  # GET /carts_products
  # GET /carts_products.json
  def index
    @carts_products = @cart.carts_products.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts_products }
    end
  end

  # GET /carts_products/1
  # GET /carts_products/1.json
  def show
    @carts_product = @cart.carts_products.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @carts_product }
    end
  end

  # GET /carts_products/new
  # GET /carts_products/new.json
  def new
    @carts_product = @cart.carts_products.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @carts_product }
    end
  end

  # GET /carts_products/1/edit
  def edit
    @carts_product = @cart.carts_products.find(params[:id])
  end

  # POST /carts_products
  # POST /carts_products.json
  def create
    @carts_product = @cart.carts_products.build(:products_id => params[:products_id].to_i)

    respond_to do |format|
      if @carts_product.save
        format.html { redirect_to :back, notice: 'Carts product was successfully created.' }
        format.json { render json: @carts_product, status: :created, location: @carts_product }
      else
        format.html { render action: "new" }
        format.json { render json: @carts_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts_products/1
  # PUT /carts_products/1.json
  def update
    @carts_product = @cart.carts_products.find(params[:id])

    respond_to do |format|
      if @carts_product.update_attributes(params[:carts_product])
        format.html { redirect_to :back, notice: 'Carts product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @carts_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts_products/1
  # DELETE /carts_products/1.json
  def destroy
    @carts_product = @cart.carts_products.find(params[:id])
    @carts_product.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

  def get_cart
    @cart = current_cart
  end
end
