class SearchController < ApplicationController  
  def index
    unless params[:search].blank?
      @results = User.search(( params[:query].present? ? params[:query] : '*' )).records
    end
  end

  def searchuser
    if params[:query].nil?
      @post = []
    else
      @post = Post.search params[:query]
    end
  end
end