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

      #all orders
      #index.html.erb
      def index
            @orders = Order.all
      end

      #all open orders 
      #open.html.erb
      def open_orders 
        authorize! :read, @orders
        @orders = Order.where(:open => true)
      end

      #all closed orders 
      #closed.html.erb
      def closed_orders
        authorize! :read, @orders        
        @orders = Order.where(:open => false)
      end

      #open orders by company_id
      #company_open_orders.html.erb
      def company_open_orders
        @user = User.find(session[:user_id])     
        @orders = Order.where(user_id: @user.id, company_id: @user.company_id, :open => true)
      end

    #   All orders by user's company_id
    #   company_all_orders_by_users_company.html.erb
      def company_all_orders_by_users_company
        @user = User.find(session[:user_id])     
        @orders = Order.where(user_id: @user.id, company_id: @user.company_id)
      end

    #   All orders by company
    #   company_all_orders_by_users_company.html.erb
      def orders_by_company
        authorize! :read, @orders
        @orders = Order.where(params[:company_id])
      end
  
        #orders for delivery tomorrow/ production today
      #index.html.erb
      def todays_production
        authorize! :read, @orders        
        @orders = Order.where("DATE(delivery_date) = ?", Date.today + 1.day)
      end


      #show shopping cart with products by user id
      #show.html.erb
      def show
      @shopping_cart = Order.where(:user_id => session[:user_id]).last
      end
  
      #This finds the order and updates based on order params, redirecting to add the true to order complet, thus completing the order
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

    def company_params
      params.require(:company).permit(:id, :company_name)
    end


  
end
