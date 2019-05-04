class CreateExpoTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :expo_tokens do |t|
      t.string :expo_token

      t.timestamps
    end
  end
end
