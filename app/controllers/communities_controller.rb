class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @communities = Community.all
    @q = @communities.search(params[:q])
    @communities = @q.result
    respond_with(@communities)
  end

  def show
    respond_with(@community)
  end

  def new
    @community = Community.new(:parent_id => params[:parent_id])
    respond_with(@community)
  end

  def edit
  end

  def create
    @community = Community.new(community_params)
    @community.save
    respond_with(@community)
  end

  def update
    @community.update(community_params)
    respond_with(@community)
  end

  def destroy
    @community.destroy
    respond_with(@community)
  end

  def move_higher
    @community = Community.find(params[:id])
    @community_target = Community.siblings_of(@community).where(:position=>@community.position-1).first
    @community.move_to_left_of(@community_target) if @community_target
    respond_to do |format|
      format.html { redirect_to communities_path }
    end
  end

  def move_lower
    @community = Community.find(params[:id])
    @community_target = Community.siblings_of(@community).where(:position=>@community.position+1).first
    @community.move_to_right_of(@community_target) if @community_target
    respond_to do |format|
      format.html { redilect_to communities_path }
    end
  end

  private
    def set_community
      @community = Community.find(params[:id])
    end

    def community_params
      params.require(:community).permit(:name, :logo, :email, :purpose, :activity, :end_date, :leader, :parent_id)
    end
end
