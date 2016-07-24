class ThumbnailController < ApplicationController

	def show
		@theme_tag=ThemeTag.find(params[:id])
		d =ThemeTag.find(params[:id]).thumbnail
		send_data d, type: image.content_type, disposition: "inline"
	end
end
