class RemoveExpoTokenFromNotifications < ActiveRecord::Migration[5.2]
  def change
    remove_column :notifications, :expo_token
  end
end
