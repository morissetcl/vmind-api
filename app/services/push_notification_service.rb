class PushNotificationService
  attr_reader :title, :body
  include HTTParty

  def initialize(args)
    @title = args[:title]
    @body = args[:body]
  end

  def call
    expo_tokens = ExpoToken.pluck(:token)
    expo_tokens.each do |expo_token|
      HTTParty.post(
        "https://exp.host/--/api/v2/push/send",
        body: {
          "to"     => expo_token,
          "title"  => title,
          "body"   => body
        }
      )
    end
  end
end
