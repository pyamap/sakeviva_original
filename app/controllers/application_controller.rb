class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery :except => [:purchase]
  before_filter :configure_permitted_parameters, if: :devise_controller?
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

  protected
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:name, :email, :password, :password_confirmation, :remember_me)}
  		devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:login, :name, :email, :password, :remember_me)}
  		devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:name, :email, :password, :password_confirmation, :current_password)}
  	end

end
