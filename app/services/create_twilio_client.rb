class CreateTwilioClient

	def initialize(phone_number, message)
		@phone_number = phone_number
		@message = message
	end

	def call
		twilio_number = ENV['TWILIO_NUMBER']
    client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    client.messages.create(from: twilio_number,to: @phone_number, body: @message)
	end

end