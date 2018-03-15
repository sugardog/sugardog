User.seed do |s|
	s.id = 1
	s.first_name = "井出"
	s.last_name = "諒"
	s.kana_first_name = "イデ"
	s.kana_last_name = "マコト"
	s.email = "sample@sample.com"
	s.zipcode = "1460092"
	s.tel = "0312345678"
	#s.prefecture_id = 
	s.address = "大田区下丸子4-0-0"
	s.password = "0123456"
	s.nickname = "makoto"
	#s.cart_id = 
	#s.doft_destroyed_at = 
end

User.seed do |s|
	s.id = 2
	s.first_name = "布袋"
	s.last_name = "寅泰"
	s.kana_first_name = "ホテイ"
	s.kana_last_name = "トモヤス"
	s.email = "sample2@sample2.com"
	s.zipcode = "1460011"
	s.tel = "0358658422"
	#s.prefecture_id = 
	s.address = "港区西麻布1-1-1"
	s.password = "888888"
	s.nickname = "hotei"
	#s.cart_id = 
	#s.doft_destroyed_at = 
end