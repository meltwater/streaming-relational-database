require 'rails_helper'

describe KeyPhrase, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:document) }
  end
end
