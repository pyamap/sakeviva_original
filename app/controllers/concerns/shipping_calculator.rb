module ShippingCalculator
  extend ActiveSupport::Concern

  def calculator
    unless cookies[:unique_shop_ids][0].blank? then
    @shop_id_first = cookies[:unique_shop_ids][0]
    @shop_id_first.present?
    @delivery_fee_first = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_first, @prefecture_id).fee
    else
    @delivery_fee_first = 0
    end

    unless cookies[:unique_shop_ids][1].blank? then
    @shop_id_second = cookies[:unique_shop_ids][1]
    @shop_id_second.present?
    @delivery_fee_second = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_second, @prefecture_id).fee
    else
    @delivery_fee_second = 0
    end

    unless cookies[:unique_shop_ids][2].blank? then
    @shop_id_third = cookies[:unique_shop_ids][2]
    @shop_id_third.present?
    @delivery_fee_third = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_third, @prefecture_id).fee
    else
    @delivery_fee_third = 0
    end

    unless cookies[:unique_shop_ids][3].blank? then
    @shop_id_fourth = cookies[:unique_shop_ids][3]
    @shop_id_fourth.present?
    @delivery_fee_fourth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_fourth, @prefecture_id).fee
    else
    @delivery_fee_fourth = 0
    end

    unless cookies[:unique_shop_ids][4].blank? then
    @shop_id_fifth = cookies[:unique_shop_ids][4]
    @shop_id_fifth.present?
    @delivery_fee_fifth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_fifth, @prefecture_id).fee
    else
    @delivery_fee_fifth = 0
    end

    unless cookies[:unique_shop_ids][5].blank? then
    @shop_id_sixth = cookies[:unique_shop_ids][5]
    @shop_id_sixth.present?
    @delivery_fee_sixth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_sixth, @prefecture_id).fee
    else
    @delivery_fee_sixth = 0
    end

    unless cookies[:unique_shop_ids][6].blank? then
    @shop_id_seventh = cookies[:unique_shop_ids][6]
    @shop_id_seventh.present?
    @delivery_fee_seventh = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_seventh, @prefecture_id).fee
    else
    @delivery_fee_seventh = 0
    end

    unless cookies[:unique_shop_ids][7].blank? then
    @shop_id_eighth = cookies[:unique_shop_ids][7]
    @shop_id_eighth.present?
    @delivery_fee_eighth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_eighth, @prefecture_id).fee
    else
    @delivery_fee_eighth = 0
    end

    unless cookies[:unique_shop_ids][8].blank? then
    @shop_id_nineth = cookies[:unique_shop_ids][8]
    @shop_id_nineth.present?
    @delivery_fee_nineth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_nineth, @prefecture_id).fee
    else
    @delivery_fee_nineth = 0
    end

    unless cookies[:unique_shop_ids][9].blank? then
    @shop_id_tenth = cookies[:unique_shop_ids][9]
    @shop_id_tenth.present?
    @delivery_fee_tenth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_tenth, @prefecture_id).fee
    else
    @delivery_fee_tenth = 0
    end

    unless cookies[:unique_shop_ids][10].blank? then
    @shop_id_eleventh = cookies[:unique_shop_ids][10]
    @shop_id_eleventh.present?
    @delivery_fee_eleventh = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_eleventh, @prefecture_id).fee
    else
    @delivery_fee_eleventh = 0
    end

    unless cookies[:unique_shop_ids][11].blank? then
    @shop_id_twelveth = cookies[:unique_shop_ids][11]
    @shop_id_twelveth.present?
    @delivery_fee_twelveth = Shipping.find_by("shop_id = ? and prefecture_id = ?", @shop_id_twelveth, @prefecture_id).fee
    else
    @delivery_fee_twelveth = 0
    end


    @total_shipping_fee = @delivery_fee_first + @delivery_fee_second + @delivery_fee_third + @delivery_fee_fourth + @delivery_fee_fifth + @delivery_fee_sixth + @delivery_fee_seventh + @delivery_fee_eighth + @delivery_fee_nineth + @delivery_fee_tenth + @delivery_fee_eleventh + @delivery_fee_twelveth
    cookies[:total_shipping_fee] = @total_shipping_fee
  end
end