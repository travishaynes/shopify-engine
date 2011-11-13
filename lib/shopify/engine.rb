class Shopify::Engine < Rails::Engine
  config.generators do |g|
    g.test_framework  :rspec
  end
  
  config.before_configuration do
    config.shopify = Shopify.configuration
  end
  
  initializer "shopify_engine.include_session" do
    ActionController::Base.send :include, Shopify::Session
    ActionController::Base.send :include, Shopify::Billing
  end
  
  initializer "shopify_engine.include_helper_methods" do
    ActionController::Base.send :helper_method, :current_shop
    ActionController::Base.send :helper_method, :current_plan
    ActionController::Base.send :helper_method, :ensure_merchant_has_paid
  end
  
  initializer "shopify_engine.setup_session" do
    Shopify.setup_session
  end
end
