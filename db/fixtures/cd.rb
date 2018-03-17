Cd.seed do |s|
	s.id = 1
	s.album_name = "二十歳のモーニング娘。"
	s.album_kana_name = "ニジュッサイのモーニングムスメ"
	s.artist_id = 7
	s.image = Rails.root.join("db/fixtures/images/momus1.jpg").open
	s.label = "Zetima"
	s.price = 1543
	s.stock = 100
	s.release_date = "2018年2月22日"
	s.cd_introduction = "モーニング娘。誕生20周年！"
end

Cd.seed do |s|
	s.id = 2
	s.album_name = "May Dream"
	s.album_kana_name = "メイドリーム"
	s.artist_id = 1
	s.image = Rails.root.join("db/fixtures/images/aiko1.jpg").open
	s.label = "ポニーキャニオン"
	s.price = 3146
	s.stock = 100
	s.release_date = "2016/05/18"
	s.cd_introduction = "2年振り 通算12枚目のオリジナル・アルバム。"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 3
	s.album_name = "君の名は。"
	s.album_kana_name = "キミノナハ"
	s.artist_id = 14
	s.image = Rails.root.join("db/fixtures/images/rad2.jpg").open
	s.label = "ユニバーサルミュージック"
	s.price = 3146
	s.stock = 1300
	s.release_date = "2016/08/24"
	s.cd_introduction = "主題歌と劇伴曲を収録したアルバム。"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 4
	s.album_name = "15 thank you, too"
	s.album_kana_name = "サンキュー　トゥー"
	s.artist_id = 7
	s.image = Rails.root.join("db/fixtures/images/momus2.jpg").open
	s.label = "zetima"
	s.price = 3020
	s.stock = 20
	s.release_date = "2017/12/06"
	s.cd_introduction = "約3年ぶりとなる通算15枚目のオリジナルアルバムをリリース!"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 5
	s.album_name = "泡のような愛だった"
	s.album_kana_name = "アワノヨウナアイダッタ"
	s.artist_id = 1
	s.image = Rails.root.join("db/fixtures/images/aiko2.jpg").open
	s.label = "ポニーキャニオン"
	s.price = 3146
	s.stock = 100
	s.release_date = "2014/05/28"
	s.cd_introduction = "11枚目となるオリジナル・アルバム。"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 6
	s.album_name = "まとめⅡ"
	s.album_kana_name = "マトメ"
	s.artist_id = 1
	s.image = Rails.root.join("db/fixtures/images/aiko4.jpg").open
	s.label = "ポニーキャニオン"
	s.price = 3146
	s.stock = 100
	s.release_date = "2011/02/23"
	s.cd_introduction = "デビュー13年目(2011年時)にして初のリリースとなる､aikoのベスト･アルバム｡"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 7
	s.album_name = "時のシルエット"
	s.album_kana_name = "トキノシルエット"
	s.artist_id = 1
	s.image = Rails.root.join("db/fixtures/images/aiko3.jpg").open
	s.label = "ポニーキャニオン"
	s.price = 2426
	s.stock = 100
	s.release_date = "2012/06/20"
	s.cd_introduction = "前作『BABY』から約2年3ヶ月ぶり通算10枚目のオリジナル･アルバム"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 8
	s.album_name = "カラヤン超定番ベスト"
	s.album_kana_name = "カラヤンチョウテイバンベスト"
	s.artist_id = 8
	s.image = Rails.root.join("db/fixtures/images/karayan_favorite.jpg").open
	s.label = "DG Deutsche Grammophon"
	s.price = 3120
	s.stock = 100
	s.release_date = "2018/03/07"
	s.cd_introduction = "これぞ鉄板!クラシック名曲ベスト20を巨匠カラヤンの美しいサウンド"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 9
	s.album_name = "ザ・ベスト デラックス・エディション"
	s.album_kana_name = "ザ・ベスト デラックス・エディション"
	s.artist_id = 13
	s.image = Rails.root.join("db/fixtures/images/ariana_favorite.jpg").open
	s.label = "ユニバーサルミュージック"
	s.price = 3402
	s.stock = 100
	s.release_date = "2017/09/27"
	s.cd_introduction = "世界がときめく超実力派歌姫、アリアナ・グランデのベスト盤"
	#s.campaign_id = 
end

Cd.seed do |s|
	s.id = 10
	s.album_name = "SHADOWS"
	s.album_kana_name = "シャドウズ"
	s.artist_id = 4
	s.image = Rails.root.join("db/fixtures/images/lynch_favorite.jpg").open
	s.label = "marginal works"
	s.price = 3086
	s.stock = 100
	s.release_date = "2009/07/08"
	s.cd_introduction = ""
	#s.campaign_id = 
end