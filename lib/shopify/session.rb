module Shopify::Session
  def shopify_session
    if session.include?(:shopify) && session[:shopify].respond_to?(:site)
      begin
        ShopifyAPI::Base.site = session[:shopify].site
        yield
      ensure 
        ShopifyAPI::Base.site = nil
      end
    else
      session[:return_to] = request.fullpath
      redirect_to login_path
    end
  end
  
  def current_shop
    session[:shopify]
  end
end
