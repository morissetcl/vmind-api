# frozen_string_literal: true

json.feelings @feelings do |feeling|
  json.mood feeling.mood
  json.deviceId feeling.deviceId
end
