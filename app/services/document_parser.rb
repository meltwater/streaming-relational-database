class DocumentParser

  def self.documents_from_json(json)
    documents = []
    JSON.parse(json).each do |record|
      document = Document.new

      set_document_attributes(record, document)
      set_key_phrases(record, document)
      set_matched_keywords(record, document)
      set_source(record, document)

      if document.save
        documents << document
      else
        Rails.logger.error "Could not save document: #{document.inspect}"
      end
    end
    documents
  end

  def self.set_document_attributes(data, document)
    document.title          = data['document_title']
    document.image_link     = data['document_image_link']
    document.author         = data['document_author']
    document.publish_date   = data['document_publish_date']
    document.language_code  = data['document_language_code']
    document.sentiment      = data['document_sentiment']
    document.url            = data['document_url']
    document.meltwater_uuid = data['document_id']
    document.city           = data['document_city']
    document.region         = data['document_region']

    if data['metadata'].present?
      document.search_name    = data['metadata']['search_name']
      document.search_id      = data['metadata']['search_id']
      document.hook_id        = data['metadata']['hook_id']
    end
  end

  def self.set_key_phrases(data, document)
    data['document_key_phrases'].each do |key_phrase|
      document.key_phrases.new(
        phrase: key_phrase['phrase'], relevance: key_phrase['relevance']
      )
    end
  end

  def self.set_matched_keywords(data, document)
    data['document_matched_keywords'].each do |keyword|
      document.matched_keywords.new(value: keyword)
    end
  end

  def self.set_source(data, document)
    document.build_source(
      name:             data['source_name'],
      country_code:     data['source_country_code'],
      sub_region:       data['source_subregion'],
      information_type: data['source_information_type'],
      reach:            data['source_reach']
    )
  end

end
