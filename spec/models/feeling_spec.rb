require 'rails_helper'

describe Feeling, type: :model do
  it { should validate_presence_of :deviceId }
  it { should validate_presence_of :mood }
end
