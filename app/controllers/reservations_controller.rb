class ReservationsController < ApplicationController

	before_action :ordered_product, only:[:new, :create]

	def new
		@current_address = Address.find(params[:address])
		@quantity = params[:quantity]
		@total_price = "#{@order.product.value*@quantity.to_i}"
	end

	def create
	  # Amount in cents
	  @amount = 500#引き落とす金額
	　　　 ###この操作で、Stripe から帰ってきた情報を取得します
	  customer = Stripe::Customer.create(
	    :email => params[:stripeEmail], #emailは暗号化されずに受け取れます
	    :source  => params[:stripeToken] #めちゃめちゃな文字列です 
	  )

	  ###この操作で、決済をします
	  charge = Stripe::Charge.create(
	    :customer    => current_user.id,
	    :amount      => @amount,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_charge_path
	end

	private

	def ordered_product
		@order = Order.new
		@order.product = Product.find(params[:product_id])
	end

=begin

	def create
      # 予約をパラメーター付与して作成

      user = current_user

      amount = @total_price

      begin
      	charge_attrs = {
      		amount: amount,
      		currency: user.currency,
      		source: params[:token],
      		description: "Stripeの支払テスト"
      	}

      	charge_attrs[:destination] = user.stripe_user_id
      	charge = Stripe::Charge.create( charge_attrs )

      	flash[:notice] = "Charged successfully"

      rescue Stripe::CardError => e
      	error = e.json_body[:error][:message]
      	flash[:error] = "Charged failed! #{error}"

      end

      redirect_to "/thank_you", notice: "予約が完了しました。" 
    end

=end

end