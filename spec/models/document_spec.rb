require 'rails_helper'

describe Document do
  describe 'associations' do
    it { is_expected.to have_many(:matched_keywords) }
    it { is_expected.to have_many(:key_phrases) }
  end
end
