# frozen_string_literal: true

FactoryBot.define do
  factory :verse do
    need { 'Faith' }
    theme { 'Spirit' }
    name { 'Exode 2:3' }
    content { "Ne pouvant plus le cacher, elle prit une caisse de jonc, qu'elle enduisit de bitume et de poix; elle y mit l'enfant, et le déposa parmi les roseaux, sur le bord du fleuve." }
  end
end
