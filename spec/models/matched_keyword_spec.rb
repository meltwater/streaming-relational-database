require 'rails_helper'

describe MatchedKeyword do
  describe 'associations' do
    it { is_expected.to belong_to(:document) }
  end
end
