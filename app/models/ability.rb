class Ability
  include CanCan::Ability

  def initialize(user)



      if user.admin?
        can :manage, all
      else
        can :create, :read, :update, Order do |order|
          order.user == user
        end
        can :create, :read, :update, Order_Product do |order_product|
          order_product.user == user
        end
        can :create, :read, :update, Standing_Order do |standing_order|
          standing_order.user == user
        end

        can :read, Product
        can :read, Product_Type
        can :read, Quantity_Type
      end
   
  end
end
