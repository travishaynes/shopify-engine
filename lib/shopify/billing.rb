module Shopify::Billing
  
  def ensure_merchant_has_paid
    # TODO: set this up
  end
  
  # gets the current plan the shop is using
  # @return [Plan] the plan
  # @example Get the current plan's name
  #   unless current_plan.nil?
  #     name = current_plan.name
  #   end
  # @api public
  def current_plan
    shopify_session do
      plan = ShopifyAPI::RecurringApplicationCharge.current
      return nil if plan.nil?
      return Plan.where(:name => plan.name).first
    end
  end
  
end
