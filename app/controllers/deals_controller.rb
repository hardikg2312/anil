class DealsController < ApplicationController

  def index
    per_page = 16
    @categories = Category.all
    @category = Category.friendly.find_by_slug(params[:catogory]) if params[:catogory].present? && params[:catogory] != 'all'
    @deals = @category.deals.where(:deal_valid => true).order('id desc').paginate(:page => current_page, :per_page => per_page) if @category
    @deals ||= Deal.includes(:category).where(:deal_valid => true).order('id desc').paginate(:page => current_page, :per_page => per_page)
    respond_to do |format|
      format.html
      format.js
    end
  end
end
