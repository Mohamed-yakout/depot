class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # before_filter: :current_cart
  protect_from_forgery with: :exception
  
	def current_cart(cart_id = session[:cart_id])
		cart = Cart.find(cart_id)
		rescue ActiveRecord::RecordNotFound
		cart = Cart.create
		session[:cart_id] = cart.id
		cart
	end
end
