class Admin::PhotosController < Admin::Base
	def crate
		@photo = Photo.new(photo_params)
		if @photo.save
			render json: { message: "success", photoId: @photo.id}, status: 200
		else
			render json: { error: @photo.errors.full_messages.join(", ")},  status: 400
		end
	end

	def destroy
		@photo = Photo.find(params[:product_id])
		if @photo.destroy
			render json: { message: "file deleted from server"}
		else
			render json: { message: @photo.errors.full_messages.join(", ")}
		end
	end

	def list
		product = Product.find(params[:id])

		photos = []
		Photo.where(product_id: product.id).each do |photo|
			new_photo = {
				id: photo.id,
				name: photo.image_file_name,
				size: photo.image_file_size,
				src: photo.image(:thumb)
			}
			photos.push(new_photo)
		end
		render json: { images: photos }
	end

	private
	def photo_params
		params.require(:photo).permit(:image,:product_id)
	end
end