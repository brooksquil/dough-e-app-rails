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

        can :read, Product
        can :read, ProductType
        can :read, QuantityType
      end
   
  end
end
