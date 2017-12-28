class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def add_to_cart
    @order = Order.find_or_create_by!(user_id: session[:user_id], payment_type_id: nil)
        # order.payment_type_id = User.find(session[:user_id]).payment_type.first.id
    @order.errors.full_messages
    @order_product = OrderProduct.new(params.permit(:product_id))
    # puts @order_product.id
    @order_product.order_id = @order.id
    @order_product.save
    puts @order_product.errors.full_messages
    redirect_to shopping_cart_path(@order)
  end

  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @shopping_cart = Order.where(:user_id => session[:user_id], :payment_type => nil).last
  end


  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit 
    @payment_types = PaymentType.where(:user_id => session[:user_id])
    @order = Order.where(:user_id => session[:user_id], :payment_type => nil).last
  end

  def delete_product_from_order
    @shopping_cart = Order.where(:user_id => session[:user_id], :payment_type => nil).last
    puts params
    @destroy_product = Product.find(params[:format])
    @shopping_cart.products.delete(@destroy_product)
    redirect_to shopping_cart_path
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    @order = Order.where(:user_id => session[:user_id], :payment_type => nil).last
    @order.update(order_params)
    redirect_to orders_path
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
 # deletes shopping cart
    #show.html.erb
    def destroy
      @order = Order.find_by(params[:id])
      @order.products.destroy_all
      @order.destroy
      redirect_to product_types_path
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_order
    #   @order = Order.find(params[:id])
    # end

    def order_params
      params.require(:order).permit(:user_id, :payment_type_id, :id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:delivery_date, :company_id, :user_id, :payment_id_id)
    end
end
