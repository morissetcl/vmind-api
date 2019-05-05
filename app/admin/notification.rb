# frozen_string_literal: true

ActiveAdmin.register Notification do
  permit_params :title, :body, :expo_token, :utf8, :authenticity_token, :notification, :commit


  controller do
    def create
      notification = Notification.create!(notification_params)
      return unless notification.save
      PushNotificationService.new(expo_token: notification.expo_token,
                                  title: notification.title,
                                  body: notification.body
                                 ).call
      redirect_to admin_notification_path notification
    end

    def notification_params
      params.require(:notification).permit(:title, :body, :expo_token)
    end
  end
end
