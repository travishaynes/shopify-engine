require 'shopify_api'

module Shopify
  require 'shopify/configuration'
  require 'shopify/session'
  require 'shopify/billing'
  require 'shopify/engine'
  
  def self.configuration
    @configuration ||= Shopify::Configuration.new
  end
  
  def self.setup_session
    ShopifyAPI::Session.setup(
      api_key: Shopify.configuration.api_key,
      secret:  Shopify.configuration.secret
    )
  end
end
