require "rubygems"
require "twitter"
#require 'twitter_api.rb'

	@rest_client ||= Twitter::REST::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = ENV['VC_CONSUMER_KEY']
		config.consumer_secret = ENV['VC_CONSUMER_SECRET']
		config.access_token =  ENV['VC_ACCESS_TOKEN']
		config.access_token_secret = ENV['VC_ACCESS_TOKEN_SECRET']
	end

	stream_client ||= Twitter::Streaming::Client.new do |config|
		puts "Configuring Twitter access token..."
		config.consumer_key = ENV['VC_CONSUMER_KEY']
		config.consumer_secret = ENV['VC_CONSUMER_SECRET']
		config.access_token =  ENV['VC_ACCESS_TOKEN']
		config.access_token_secret = ENV['VC_ACCESS_TOKEN_SECRET']
	end	

	def tweet_it(tweet)
 		@rest_client.update(tweet)
 	end

 	def puteada
 		intro = [ "Páseme a su mamá culicagado ", "Coja oficio chino ", "No me joda más pelaíto ",
 				"Quien le dio mi twitter chino ", "Ábrase ", "Déjeme en paz culicagado " "Coma mierda chino "]
 		insultos = ["comemierda","pirobo", "gonorrea", "sieteleches", "nacidoporelano", "hijueputa", 
 					"doblehijueputa", "mengamprea", "gorsobia", "paridoabrincos", "guaricha",
 					"setentahijueputa", "triplemalparido", "remalparido", "chancroneaequina", 
 					"hijodelagranputa", "hijodeunahienacalva", "espantalavirgen", "pichurria",
 					"sanguijuelaexcremental", "garnopapolla", "pentablasborria", "chupamelculo", "sarnoso",
 					 "rasuramelaxila", "desadaptado", "recontragonorrea", "carepeo", "chupaverga"]
 		outro = [". Le voy a decir a sus papás.", ". Siga jodiendo y verá", ". Yo se quién es ud.",
 				". Espere y verá.", ". Suerte gonorrea picha.", ". Adiós garrapata inmunda.", ". Ojalá se muera, perro."]
 		result = intro.sample.to_s << insultos.sample(3).join(", ") << outro.sample.to_s
 		return result
 	end

 	user = "laviejacucha"
	stream_client.user do |object|
		case object
			when Twitter::Tweet
				result = puteada
				reply_to = object.user.screen_name
				reply_tweet = result
	 			tweet_it(reply_tweet) if object.is_a?(Twitter::Tweet)
	 			puts "@#{object.user.screen_name} #{reply_tweet}"
	 			puts "@#{object.user.screen_name} #{object.text}" if object.is_a?(Twitter::Tweet)
	 			puts reply_tweet.length
 		end
 	end