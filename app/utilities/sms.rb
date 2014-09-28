class SMS
  ERROR = Twilio::REST::RequestError

  # attr_reader :phone_number

  # def initialize(phone_number)
  #   @phone_number = phone_number
  # end

  def deliver(phone_number, new_message)
    begin
      client.account.messages.create(:body => new_message,
                                     :to => phone_number,
                                     :from => ENV['ATV_PHONE_NUMBER'])
    rescue ERROR => e
      Rails.logger.error "Failed to send the sms to #{phone_number}. " + e.message
    end
  end

  private

  def client
    @client ||= Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end
end
