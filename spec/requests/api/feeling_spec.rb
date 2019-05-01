# frozen_string_literal: true

require 'rails_helper'

describe 'Feelings' do
  describe 'POST' do
    let(:params) do
      {
        deviceId: '0099789',
        mood: 'Joy'
      }
    end

    it do
      post "/api/v1/feelings", params: params
      expect(Feeling.count).to eq 1
      expect(Feeling.last.deviceId).to eq '0099789'
      expect(Feeling.last.mood).to eq 'Joy'
    end
  end

  describe 'GET' do
    let!(:feeling_to_include_1) do
      create :feeling, mood: 'Sad', deviceId: 'PO90KL66'
    end
    let!(:feeling_to_include_2) do
      create :feeling, mood: 'Joy', deviceId: 'PO90KL66'
    end
    let!(:feeling_to_exclude) do
      create :feeling, mood: 'Joy', deviceId: 'PPPOPO0KL66'
    end

    before do
      get "/api/v1/feelings?deviceId=#{feeling_to_include_1.deviceId}"
      json = JSON.parse(response.body)
      @feeling_json = json['feelings']
    end

    it do
      expect(@feeling_json.count).to eq 2
      expect(@feeling_json[1]['deviceId']).to eq 'PO90KL66'
      expect(@feeling_json[1]['mood']).to eq 'Joy'
    end
  end
end
