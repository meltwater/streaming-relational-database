require 'rails_helper'

describe DocumentParser do
  describe 'parsing an editorial payload' do
    before do
      editorial_json = File.read('./spec/support/editorial_payload.json')
      @results = DocumentParser.new(editorial_json).parse_documents
    end

    it 'returns a document for an editorial payload' do
      expect(@results).to      be_a(Array)
      expect(@results.size).to eq(1)
    end

    it 'saves the correct document data' do
      document = @results.first
      expect(document).to                be_a(Document)
      expect(document.title).to          eq("Musk Throws 'Pie' at Naysayers as Tesla Posts Rare Profit")
      expect(document.image_link).to     eq("http://i1.myinforms.com/300x200/default.jpg")
      expect(document.author).to         eq("John Doe")
      expect(document.title).to          eq("Musk Throws 'Pie' at Naysayers as Tesla Posts Rare Profit")
      expect(document.publish_date).to   be_within(0.1).of(Time.parse("2016-02-01T05:10:14.371Z"))
      expect(document.language_code).to  eq("en")
      expect(document.sentiment).to      eq("negative")
      expect(document.url).to            eq("http://myinforms.com/en-us/a/43897824-musk-throws-pie-at-naysayers-as-tesla-posts-rare-profit/")
      expect(document.meltwater_uuid).to eq("MweugEjvEhiuFbQQmid40Gs1Y-I")
      expect(document.search_name).to    eq("hello")
      expect(document.search_id).to      eq(1234)
      expect(document.hook_id).to        eq("0a815fa3ee87489de1b932f178541f80c1f1038c")
    end

    it 'creates document key phrases' do
      document = @results.first
      expect(document.key_phrases.count).to eq(1)
      expect(document.key_phrases.map(&:phrase)).to match_array('fourth quarter')
    end

    it 'creates document matched_keywords' do
      document = @results.first
      expect(document.matched_keywords.count).to eq(2)
      expect(document.matched_keywords.map(&:value)).to match_array(["Musk", "Tesla"])
    end
  end

  describe 'parsing a social payload' do
    before do
      social_json = File.read('./spec/support/social_payload.json')
      @results = DocumentParser.new(social_json).parse_documents
    end

    it 'returns a document for an editorial payload' do
      expect(@results).to      be_a(Array)
      expect(@results.size).to eq(1)
    end

    it 'saves the correct document data' do
      document = @results.first
      expect(document).to                           be_a(Document)
      expect(document.title).to                     eq("Some tweet")
      expect(document.image_link).to                eq("http://example.com/image")
      expect(document.author).to                    eq("Meltwater")
      expect(document.publish_date).to              be_within(0.1).of(Time.parse("2016-02-01T05:10:14.371Z"))
      expect(document.language_code).to             eq("en")
      expect(document.sentiment).to                 eq("positive")
      expect(document.url).to                       eq("https://twitter.com/Meltwater/status/841701967160311810")
      expect(document.meltwater_uuid).to            eq("MweugEjvEhiuFbQQmid40Gs1Y-I")
      expect(document.search_name).to               eq("social search")
      expect(document.search_id).to                 eq(1234)
      expect(document.hook_id).to                   eq("0a815fa3ee87489de1b932f178541f80c1f1038c")
      expect(document.city).to                      eq("San Francisco")
      expect(document.region).to                    eq("California")
    end

    it 'creates a document source' do
      source = @results.first.source
      expect(source).to                  be_a(Source)
      expect(source.name).to             eq("twitter")
      expect(source.country_code).to     eq("us")
      expect(source.sub_region).to       eq("MA")
      expect(source.information_type).to eq("social")
      expect(source.reach).to            eq(18700)
    end
  end
end
