class OrdersController < ApplicationController
  before_filter :authenticate_user!, :only => :index

  # GET /orders
  # GET /orders.json
  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'

    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new
    @order.build_user_address

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])
    @order.cart_id = current_cart.id
    @order.ip_address = request.remote_ip

    if user_signed_in?
      @order.user_id = current_user.id
    end

    respond_to do |format|
      if @order.purchase
        if @order.save

          session[:cart_id] = nil
          format.html { redirect_to products_path, notice: 'Order was successfully created.' }
          format.json { render json: @order, status: :created, location: @order }
        else
          format.html { render action: 'new', notice: "Payment unsuccessful"}
          format.json { head :no_content}
        end


      else
        @cart = current_cart
        format.html { render action: "new", notice: 'purchase Unsuccessful' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
  def get_cart
    @cart = current_cart
  end
end
