# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    expo_token { 'KLpohuYY' }
    title { '2 Samuel 7' }
    body { "Dans ma détresse, j'ai invoqué l'Eternel, J'ai invoqué mon Dieu; De son palais, il a entendu ma voix, Et mon cri est parvenu à ses oreilles." }
  end
end
