class Posts::DocumentsController < ApplicationController
  before_action :set_posts_document, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts_documents = Posts::Document.all
    respond_with(@posts_documents)
  end

  def show
    respond_with(@posts_document)
  end

  def new
    @posts_document = Posts::Document.new
    respond_with(@posts_document)
  end

  def edit
  end

  def create
    @posts_document = Posts::Document.new(posts_document_params)
    @posts_document.save
    respond_with(@posts_document)
  end

  def update
    @posts_document.update(document_params)
    respond_with(@posts_document)
  end

  def destroy
    @posts_document.destroy
    respond_with(@posts_document)
  end

  private
    def set_posts_document
      @posts_document = Posts::Document.find(params[:id])
    end

    def posts_document_params
      params.require(:posts_document).permit(:text)
    end
end
