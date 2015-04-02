class Posts::PicturesController < ApplicationController
  before_action :set_posts_picture, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts_pictures = Posts::Picture.all
    respond_with(@posts_pictures)
  end

  def show
    respond_with(@posts_picture)
  end

  def new
    @posts_picture = Posts::Picture.new
    respond_with(@posts_picture)
  end

  def edit
  end

  def create
    @posts_picture = Posts::Picture.new(picture_params)
    @posts_picture.save
    respond_with(@posts_picture)
  end

  def update
    @posts_picture.update(picture_params)
    respond_with(@posts_picture)
  end

  def destroy
    @posts_picture.destroy
    respond_with(@posts_picture)
  end

  private
    def set_posts_picture
      @posts_picture = Posts::Picture.find(params[:id])
    end

    def posts_picture_params
      params.require(:posts_picture).permit(:picture)
    end
end
