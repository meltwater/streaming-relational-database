require 'rails_helper'

describe Source do
  describe 'associations' do
    it { is_expected.to belong_to(:document) }
  end
end
