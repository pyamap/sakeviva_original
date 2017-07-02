class Admin::Base < ApplicationController
	before_action :authenticate_user! #deviseによるログイン精査の為のコード
	unless current_user.admin?
	  redirect_to root_path
	end
	#before_action do
	#	redirect_to new_user_session_path unless current_user && current_user.admin?
	#end
end