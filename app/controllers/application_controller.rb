class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => [:pay]
  before_filter :current_cart, :configure_permitted_parameters, if: :devise_controller?

  # 例外処理
if Rails.env == 'production'
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404
  rescue_from Exception, with: :render_500
end

def render_404
  render template: "errors/error_404", status: 404, layout: "application", content_type: "text/html"
end

def render_500
  render template: "errors/error_500", status: 500, layout: "application", content_type: "text/html"
end


def current_cart
  @cart = find_cart
end

private

def find_cart
  unless session[:cart]
    session[:cart] = Cart.new
  end
  session[:cart]
end

protected
def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :email, :mobile, :sender, :password, :password_confirmation, :remember_me)}
	devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:login, :name, :email, :password, :remember_me)}
	devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :email, :mobile, :sender,:password, :password_confirmation, :current_password)}
end

after_filter :store_location

def store_location
  if (request.fullpath != "/users/sign_in" && \
      request.fullpath != "/users/sign_up" && \
      request.fullpath != "/users/password/new" && \
      request.fullpath != "/users/edit" && \
      !request.xhr?) # don't store ajax calls
    session[:previous_url] = request.fullpath
  end
end

def after_sign_in_path_for(resource)
  session[:previous_url] || root_path
end

def after_sign_out_path_for(resource)
  session[:previous_url] || root_path
end

end
