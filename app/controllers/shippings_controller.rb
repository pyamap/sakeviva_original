class ShippingsController < ApplicationController
	include ShippingCalculator #moduleでshipping_calculatorをimport
	def shipping_fee
		session[:unique_shop_ids] = params[":shop_id"].uniq.sort
		@prefecture_id = params[:prefecture][:prefecture_id]
		calculator #shipping_calculator内のcalculatorメソッドをコール
		flash[:prefecture_id] = @prefecture_id
		#送料を更新し、current_cartに戻した際に、prefecture_idも一緒に渡して、選んだ都道府県がselectedで選ばれた状態にしておく。
		#session内に保管し最終支払ページまでこのまま運ぶ。
		redirect_to current_cart_path
	end
end
