require 'rails_helper'

describe KeyPhrase do
  describe 'associations' do
    it { is_expected.to belong_to(:document) }
  end
end
