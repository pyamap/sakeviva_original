class Admin::Base < ApplicationController
	before_action :authenticate_user! #deviseによるログイン精査の為のコード
end