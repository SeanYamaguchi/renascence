class StaticPagesController < ApplicationController
  def home
  end

  def company
  end

  def organization
  end

  def contact
  end

  def google
  	render :layout => false
  end
end
