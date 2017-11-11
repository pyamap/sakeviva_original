class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => [:pay]
  before_filter :current_cart, :configure_permitted_parameters, if: :devise_controller?

  #include Jpmobile::ViewSelector => モバイルからのアクセスだったら、モバイルに落とす方法。モバイルの準備ができていないので、一旦コメントアウト

  #↓エラーが起きた時の処理と表示方法をまとめているが、中身が見えず使いにくいので一旦コメントアウト。
  #rescue_from Exception, with: :error500
  #rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  #def error404(e)
  #  render 'error404', status: 404, formats: [:html]
  #end

  #def error500(e)
    #logger.error [e, *backtrace].join("¥n")
    #render 'error500', status: 500, formats: [:html]
  #end

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
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :remember_me)}
		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:login, :name, :email, :password, :remember_me)}
		devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
	end

  after_filter :store_location

  def store_location
    if (request.fullpath != "/users/sign_in" && \
        request.fullpath != "/users/sign_up" && \
        request.fullpath != "/users/password/new" && \
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
