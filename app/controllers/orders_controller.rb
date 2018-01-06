class OrdersController < ApplicationController

  
      #create order when first product added
      def add_to_cart
          @user = User.find(session[:user_id])
          @order = Order.find_or_create_by!(user_id: @user.id, company_id: @user.company_id)
          @order.errors.full_messages
          @order_product = OrderProduct.new(params.permit(:product_id))
          # puts @order_product.id
          @order_product.order_id = @order.id
          @order_product.save
          puts @order_product.errors.full_messages
          redirect_to shopping_cart_path(@order)
      end
      
      #########################
      #all open orders 
      #index.html.erb
      def index
        @orders = Order.where("DATE(delivery_date) = ?", Date.today + 1.day)
      end
  
        #orders for delivery tomorrow/ production today
      #index.html.erb


      #show shopping cart with products by user id
      #show.html.erb
      def show
      @shopping_cart = Order.where(:user_id => session[:user_id]).last
      end
  
      #This finds the order and updates based on order params, redirecting to add the payment type to the order, thus completing the order
      def update
          @order = Order.where(:user_id => session[:user_id]).last
          @order.update(order_params)
          redirect_to orders_path
      end
      
      #inserts the payment type selection into order table
      def edit 
          @order = Order.where(:user_id => session[:user_id]).last
      end
  
      #deletes products from order and order
      #show.html.erb
      def delete_product_from_order
          @shopping_cart = Order.where(:user_id => session[:user_id]).last
          puts params
          @destroy_product = Product.find(params[:format])
          @shopping_cart.products.delete(@destroy_product)
          redirect_to shopping_cart_path
      end
  
      # deletes shopping cart
      #show.html.erb
      def destroy
          @order = Order.find_by(params[:id])
          @order.products.destroy_all
          @order.destroy
          redirect_to products_path
      end
  
  
  

  private
   
    def order_params
      params.require(:order).permit(:delivery_date, :company_id, :user_id, :payment_id)
    end

    def product_params
      params.require(:product).permit(:id)
    end

  
end
