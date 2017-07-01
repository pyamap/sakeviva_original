class Admin::Base < ApplicationController
	before_action :authenticate_user! #deviseによるログイン精査の為のコード
	before_action do
	redirect_to new_user_session_path unless current_user && current_user.admin?
end
end