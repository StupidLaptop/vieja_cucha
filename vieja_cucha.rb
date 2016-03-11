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
			"Quien le dio mi twitter chino ", "Ábrase ", "Déjeme en paz culicagado ", "Coma mierda chino "]
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

stream_client.user do |object|
	if object.is_a? (Twitter::Tweet)
		unless object.user.screen_name == "laviejacucha" 
			reply_to = object.user.screen_name
			reply_text = puteada
			reply_message = "@#{reply_to} #{reply_text}"
			#puts reply_message
			#puts reply_message.length 
			tweet_it(reply_message) 
		end 
	end
end