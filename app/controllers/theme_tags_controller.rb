class ThemeTagsController < ApplicationController

	def show
		@theme_tag=ThemeTag.find(params[:id])
	end
end
