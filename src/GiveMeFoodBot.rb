require 'telegram/bot'
require 'google_places'

token = 'YOUR-TELEGRAM-BOT-TOKEN'
@googleClient = GooglePlaces::Client.new('YOUR-GOOGLE-PLACES-API-TOKEN')

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    if message.location
      l = message.location
      restaurants = @googleClient.spots(l.latitude, l.longitude, :types => ['restaurant','food'], :radius => 500)
      for r in restaurants
        bot.api.send_location(chat_id: message.chat.id, latitude: r.lat, longitude: r.lng)
      end
    end
    case message.text
      when '/food'
        kb = [Telegram::Bot::Types::KeyboardButton.new(text: 'Show me your location', request_location: true)]
        markup = Telegram::Bot::Types::ReplyKeyboardMarkup.new(keyboard: kb)
        bot.api.send_message(chat_id: message.chat.id, text: 'Hey!', reply_markup: markup)
    end
  end
end
