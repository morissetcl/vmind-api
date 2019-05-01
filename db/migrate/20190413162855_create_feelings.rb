# frozen_string_literal: true

class CreateFeelings < ActiveRecord::Migration[5.2]
  def change
    create_table :feelings do |t|
      t.string :deviceId
      t.string :mood

      t.timestamps
    end
  end
end
