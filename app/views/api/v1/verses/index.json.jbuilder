# frozen_string_literal: true

json.verses @verses do |verse|
  json.need verse.need
  json.theme verse.theme
  json.name verse.name
  json.content verse.content
end
