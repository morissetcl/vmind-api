class PushNotificationService
  attr_reader :expo_token, :title, :body
  include HTTParty

  def initialize(args)
    @expo_token = args[:expo_token]
    @title = args[:title]
    @body = args[:body]
  end

  def call
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
