class Document < ApplicationRecord
  has_many :matched_keywords
  has_many :key_phrases
end
