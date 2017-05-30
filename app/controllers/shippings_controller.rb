class ShippingsController < ApplicationController
	def shipping_fee
		unless params[":shop_id"][0].blank? then
		@shop_id_first = params[":shop_id"][0]
		@shop_id_first.present?
		@delivery_fee_first = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_first, params[:prefecture][:prefecture_id]).fee
		else 
		@delivery_fee_first = 0
		end 

		unless params[":shop_id"][1].blank? then
		@shop_id_second = params[":shop_id"][1]
		@shop_id_second.present?
		@delivery_fee_second = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_second, params[:prefecture][:prefecture_id]).fee
		else 
		@delivery_fee_second = 0
		end

		unless params[":shop_id"][2].blank? then
		@shop_id_third = params[":shop_id"][2]
		@shop_id_third.present?
		@delivery_fee_third = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_second, params[:prefecture][:prefecture_id]).fee
		else 
		@delivery_fee_third = 0
		end

		unless params[":shop_id"][3].blank? then
		@shop_id_fourth = params[":shop_id"][3]
		@shop_id_fourth.present?
		@delivery_fee_fourth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_second, params[:prefecture][:prefecture_id]).fee
		else 
		@delivery_fee_fourth = 0
		end

		@total_shipping_fee = @delivery_fee_first + @delivery_fee_second + @delivery_fee_third + @delivery_fee_fourth
		flash[:total_shipping_fee] = @total_shipping_fee
			
		redirect_to current_cart_path
	end
end
