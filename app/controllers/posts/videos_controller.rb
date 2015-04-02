class Posts::VideosController < ApplicationController
  before_action :set_posts_video, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts_videos = Posts::Video.all
    respond_with(@posts_videos)
  end

  def show
    respond_with(@posts_video)
  end

  def new
    @posts_video = Posts::Video.new
    respond_with(@posts_video)
  end

  def edit
  end

  def create
    @posts_video = Posts::Video.new(video_params)
    @posts_video.save
    respond_with(@posts_video)
  end

  def update
    @posts_video.update(video_params)
    respond_with(@posts_video)
  end

  def destroy
    @posts_video.destroy
    respond_with(@posts_video)
  end

  private
    def set_posts_video
      @posts_video = Posts::Video.find(params[:id])
    end

    def posts_video_params
      params.require(:posts_video).permit(:video)
    end
end
