class Shopify::SessionController < ApplicationController
  def index
    # redirect to root path if already logged in
    redirect_to root_path, :alert => 'You are already logged in!' if session.include? :shopify
    # redirect to authenticate path if shop is already present
    redirect_to shopify_authenticate_path if params[:shop].present?
  end
  
  def authenticate
    if params[:shop].present?
      redirect_to ShopifyAPI::Session.new(params[:shop]).create_permission_url
    else
      redirect_to :back, :alert => "You entered a blank domain, please try again."
    end
  end
  
  # Shopify redirects the logged-in user back to this action along with the
  # authorization token t. This token is later combined with the developer's
  # shared secret to form the password used to call API methods.
  def finalize
    # issue a new session identifier and declare the old one invalid so an
    # attacker cannot use the fixed session identifier
    reset_session
    
    shopify_session = ShopifyAPI::Session.new(params[:shop], params[:t], params)
    if shopify_session.valid?
      session[:shopify] = shopify_session
      redirect_to return_address
      session[:return_to] = nil
    else
      redirect_to shopify_login_path, :error => "Could not sign in to Shopify shop."
    end
  end
  
  def logout
    if session[:shopify]
      # reset the session variables
      reset_session
      redirect_to root_path, :notice => 'Successfully logged out.'
    else
      redirect_to root_path, :alert => 'You are not signed in.'
    end
  end

  private

  def return_address
    session[:return_to] || root_path
  end
end
