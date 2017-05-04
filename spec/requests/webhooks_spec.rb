require 'rails_helper'

describe 'POST webhooks' do
  let(:params)  { File.read('./spec/support/editorial_payload.json') }
  let(:headers) { { "CONTENT_TYPE" => "application/json" } }

  it 'returns a status 200' do
    post '/webhooks', params: params, headers: headers

    expect(response).to have_http_status 200
  end

  it 'creates a document' do
    post '/webhooks', params: params, headers: headers

    document = Document.last
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

  it 'creates nested attributes' do
    post '/webhooks', params: params, headers: headers

    document = Document.last
    expect(document.matched_keywords.map(&:value)).to match_array(["Musk", "Tesla"])
    expect(document.key_phrases.map(&:phrase)).to     match_array('fourth quarter')
  end
end
