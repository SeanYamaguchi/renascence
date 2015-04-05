class PostsController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :authenticate_admin_user!, except: [:show, :index]
  before_action :set_post, only: [:edit, :update, :destroy]
  before_action  :set_post_tags_to_gon, only: [:edit]

  # GET /posts
  # GET /posts.json
  def index
    @posts = params[:tag].present? ? Post.tagged_with(params[:tag]) : Post.all
    @q = @posts.search(params[:q])
    @posts = @q.result(distinct: true).includes(:tags)
  end

  def show
    @post = Post.find(params[:id])
    @documents = @post.documents.all
    @document = @post.documents.build
  end

  # GET /posts/new
  def new
    @post = Post.new
    @document = Document.new
  end

  # GET /posts/1/edit
  def edit
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params) && @post.video.recreate_versions!
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
        @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:date, :subject, :body, :picture, :video, :tag_list, :genres_list)
    end

    def video
    end

    def set_post_tags_to_gon
      gon.post_tags = @post.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Post.tags_on(:tags).pluck(:name)
    end
end
