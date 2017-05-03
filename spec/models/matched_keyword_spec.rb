require 'rails_helper'

describe MatchedKeyword, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:document) }
  end
end
