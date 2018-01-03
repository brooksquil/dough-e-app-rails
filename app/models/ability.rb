class Ability
  include CanCan::Ability

  def initialize(user)

      if user.admin?
        can :manage, :all
      else
        #customer permissions

        #for Order table
        can :create, Order do |order|
          order.user == user
        end
        can :read, Order do |order|
          order.user == user
        end
        can :update, Order do |order|
          order.user == user
        end

        # for Order_product
        can :create, OrderProduct do |order_product|
          orderProduct.user == user
        end
        can :read, OrderProduct do |orderProduct|
          orderProduct.user == user
        end
        can :update, OrderProduct do |orderProduct|
          orderProduct.user == user
        end

        #For Standing_Order
        can :create, StandingOrder do |standingOrder|
          standingOrder.user == user
        end
        can :read, StandingOrder do |standingOrder|
          standingOrder.user == user
        end
        can :update, StandingOrder do |standingOrder|
          standingOrder.user == user
        end
        can :destroy, StandingOrder do |standingOrder|
          standingOrder.user == user
        end

        can :read, Product
        can :read, ProductType
        can :read, QuantityType
      end
   
  end
end
