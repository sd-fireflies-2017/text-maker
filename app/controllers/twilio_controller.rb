class TwilioController < ApplicationController

	skip_before_action :verify_authenticity_token



  def response_message
  	phone_number = params['From']
  	message = CreateGameMessages.new(phone_number, params['Body']).determine_response
  	send_message(phone_number, message)
  end

  private

  def send_message(phone_number, message)
   CreateTwilioClient.new(phone_number, message).call
  end

 
end


# # def trigger_sms_alerts
# #     alert_message = <<MSG
# # [This is a test] ALERT!
# # It appears the server is having issues.
# # Exception: 
# # Go to: http://newrelic.com for more details."
# # MSG
# #     # image_url = 'http://howtodocs.s3.amazonaws.com/new-relic-monitor.png'

# #     admins = YAML.load_file('config/administrators.yml')
# #     puts admins
# #     admins.each do |admin|
# #       begin
# #         phone_number = admin['phone_number']
# #         send_message(phone_number, alert_message, image_url)

# #         flash[:success] = "Exception: Administrators will be notified."
# #       rescue
# #         flash[:alert] = 'Something when wrong.'
# #       end
# #     end

# #     redirect_to '/'
# # end