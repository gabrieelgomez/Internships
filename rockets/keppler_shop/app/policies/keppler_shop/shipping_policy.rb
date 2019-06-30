module KepplerShop
  # Policy for Shipping model
  class ShippingPolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end
  end
end