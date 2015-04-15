class BlogsController < ApplicationController
  before_action :authenticate_admin_user!, except: [:show, :index]
  before_action :set_blog, only: [:edit, :update, :destroy]
  before_action :set_blog_tags_to_gon, only: [:edit]

  # GET /posts
  # GET /posts.json
  def index
    @blogs = params[:tag].present? ? Blog.tagged_with(params[:tag]) : Blog.all
    @q = @blogs.search(params[:q])
    @blogs = @q.result(distinct: true).includes(:tags)
  end

  def show
    @blog = Blog.find(params[:id])
    @documents = @blog.documents.all
    @document = @blog.documents.build
  end

  # GET /posts/new
  def new
    @blog = Blog.new
    @document = Document.new
  end

  # GET /posts/1/edit
  def edit
    
  end

  # POST /posts
  # POST /posts.json
  def create
    @blog = Blog.new(blog_params)

    respond_to do |format|
      if @blog.save
        format.html { redirect_to @blog, notice: 'Blog was successfully created.' }
        format.json { render action: 'show', status: :created, location: @blog }
      else
        format.html { render action: 'new' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params) && @blog.video.recreate_versions!
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
        @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:date, :subject, :body, :picture, :video, :tag_list, :genres_list)
    end

    def video
    end

    def set_blog_tags_to_gon
      gon.blog_tags = @blog.tag_list
    end

    def set_available_tags_to_gon
      gon.available_tags = Blog.tags_on(:tags).pluck(:name)
    end
end