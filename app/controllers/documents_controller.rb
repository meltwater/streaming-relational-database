class DocumentsController < ApplicationController
  def index
    @documents = Document.order(created_at: :desc).limit(20)
  end

  def show
    @document = Document.find(params[:id])
  end
end
