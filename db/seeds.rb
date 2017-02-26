# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#p = "#{Rails.root}/db/fixtures/images/airbnb_1.png"
#ThemeTag.create(thumbnail: File.read(p))

#東北エリア
Shipping.create(:shop_id => 1, :prefecture_id => 4, :fee => 900)
Shipping.create(:shop_id => 1, :prefecture_id => 5, :fee => 900)
Shipping.create(:shop_id => 1, :prefecture_id => 6, :fee => 900)
Shipping.create(:shop_id => 1, :prefecture_id => 7, :fee => 900)

#関東エリア
Shipping.create(:shop_id => 1, :prefecture_id => 8, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 9, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 10, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 11, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 12, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 13, :fee => 750)
Shipping.create(:shop_id => 1, :prefecture_id => 14, :fee => 750)

#中部
Shipping.create(:shop_id => 1, :prefecture_id => 15, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 16, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 17, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 18, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 19, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 20, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 21, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 22, :fee => 600)
Shipping.create(:shop_id => 1, :prefecture_id => 23, :fee => 600)

#関西
Shipping.create(:shop_id => 1, :prefecture_id => 24, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 25, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 26, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 27, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 28, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 29, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 30, :fee => 550)

#中国
Shipping.create(:shop_id => 1, :prefecture_id => 31, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 32, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 33, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 34, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 35, :fee => 420)

#四国
Shipping.create(:shop_id => 1, :prefecture_id => 36, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 37, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 38, :fee => 550)
Shipping.create(:shop_id => 1, :prefecture_id => 39, :fee => 550)

#福岡
Shipping.create(:shop_id => 1, :prefecture_id => 40, :fee => 400)

#九州
Shipping.create(:shop_id => 1, :prefecture_id => 41, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 42, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 43, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 44, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 45, :fee => 420)
Shipping.create(:shop_id => 1, :prefecture_id => 46, :fee => 420)

#沖縄
Shipping.create(:shop_id => 1, :prefecture_id => 47, :fee => 650)






