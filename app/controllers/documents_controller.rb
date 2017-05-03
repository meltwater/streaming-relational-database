class DocumentsController < ApplicationController
  def index
    @documents = Document.order(publish_date: :desc).limit(20)
  end

  def show
    @document = Document.find(params[:id])
  end
end
