class Document < ApplicationRecord
  has_many :matched_keywords
  has_many :key_phrases
  has_one :source
end
