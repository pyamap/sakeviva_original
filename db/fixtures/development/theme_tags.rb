ThemeTag.seed do |s|
	s.id = 2
	s.title = "ccc"
	s.thumbnail = Rails.root.join("db/fixtures/images/kimono.jpeg").open
end
#ThemeTag.create(image: open("#{Rails.root}/db/fixtures/images/airbnb_1.png"))