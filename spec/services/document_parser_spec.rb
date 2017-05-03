require 'rails_helper'

describe DocumentParser do
  before do
    editorial_json = File.read('./spec/support/editorial_payload.json')
    @results = DocumentParser.documents_from_json(editorial_json)
  end

  it 'returns a document for an editorial payload' do
    expect(@results).to be_a(Array)
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
    document =  @results.first
    expect(document.key_phrases.count).to eq(1)
    expect(document.key_phrases.map(&:phrase)).to match_array('fourth quarter')
  end

  it 'creates document matched_keywords' do
    document =  @results.first
    expect(document.matched_keywords.count).to eq(2)
    expect(document.matched_keywords.map(&:value)).to match_array(["Musk", "Tesla"])
  end
end