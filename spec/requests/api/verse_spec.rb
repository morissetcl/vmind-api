# frozen_string_literal: true

require 'rails_helper'

describe 'Verses' do
  describe 'GET Verses' do
    let!(:verse_to_include_1) { create :verse, need: 'Love', theme: 'Parent', name: 'Exode', content: 'Hmm Parent !' }
    let!(:verse_to_include_2) { create :verse, need: 'Love', theme: 'Parent', name: 'Genese', content: 'Hmm Love !' }
    let!(:verse_to_exclude) { create :verse, need: 'Love', theme: 'Partner', name: 'Exode', content: 'Love partner' }

    before do
      get '/api/v1/verses?need=Love&theme=Parent'
      json = JSON.parse(response.body)
      @verse_json = json['verses']
    end

    it do
      expect(@verse_json[0]['need']).to eq 'Love'
      expect(@verse_json[0]['theme']).to eq 'Parent'
      expect(@verse_json[0]['content']).to eq 'Hmm Parent !'
      expect(@verse_json.length).to eq 2
    end
  end
end
