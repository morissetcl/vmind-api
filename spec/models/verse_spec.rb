require 'rails_helper'

describe Verse, type: :model do
  it { should validate_presence_of :need }
  it { should validate_presence_of :theme }
  it { should validate_presence_of :name }
  it { should validate_presence_of :content }
end
