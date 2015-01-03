class DealsController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.friendly.find_by_slug(params[:catogory]) if params[:catogory].present? && params[:catogory] != 'all'
    @deals = @category.deals.where(:deal_valid => true).order('id desc') if @category
    @deals ||= Deal.includes(:category).where(:deal_valid => true).order('id desc')
  end
end
