class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :ensure_json_request

  def ensure_json_request
    byebug
    return if request.format == :json
    render nothing: true, status: 406
  end

  def create
    byebug
    documents = DocumentParser.documents_from_json(request.raw_post)
    Rails.logger.debug(documents.inspect)

    head :ok
  end

  private

  def webhook_params
  end

  # def module_params
  #   params.require(:content_module).permit(
  #     :parent_id,
  #     :parent_type,
  #     :text,
  #     :author,
  #     :type,
  #     :id,
  #     :image,
  #     :image_copyrights,
  #     :caption,
  #     :project_id,
  #     :url,
  #     :position,
  #     :module_title
  #   )
  # end

end
