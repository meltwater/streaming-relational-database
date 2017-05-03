class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    documents = DocumentParser.new(request.raw_post).parse_documents
    Rails.logger.debug(documents.inspect)

    head :ok
  end
end
