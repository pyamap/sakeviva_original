# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#p = "#{Rails.root}/db/fixtures/images/airbnb_1.png"
#ThemeTag.create(thumbnail: File.read(p))

Delivery.create(:status => '準備中')
Delivery.create(:status => '配送中')
Delivery.create(:status => '配送完了')
