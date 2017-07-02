class Admin::Base < ApplicationController
	before_action :authenticate_user! #deviseによるログイン精査の為のコード
	before_action :is_admin?
	 
	def is_admin?
	  redirect_to root_path unless current_user.admin?
	end
	#before_action do
	#	redirect_to new_user_session_path unless current_user && current_user.admin?
	#end
end