class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    documents = DocumentParser.documents_from_json(request.raw_post)
    Rails.logger.debug(documents.inspect)

    head :ok
  end

end
