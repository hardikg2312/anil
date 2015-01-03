ActiveAdmin.register Deal do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :category_id, :deal_url, :description, :valid_till, :deal_valid, :discount_price, :price, :photo_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :title
      f.input :category_id, :as => :select, :collection => Category.all.map { |c| [ c.name, c.id ] }
      f.input :deal_url
      f.input :description
      f.input :valid_till
      f.input :deal_valid
      f.input :discount_price
      f.input :price
      #f.input :category_photo, :as => :file, :hint => f.template.image_tag(f.object.category_photo.url)
    end
    f.actions
  end

  controller do
    def show
      @deal = Deal.friendly.find_by_slug(params[:id])
    end

    def edit
      @deal = Deal.friendly.find_by_slug(params[:id])
    end

    def update
      @deal = Deal.friendly.find_by_slug(params[:id])
      super
    end

    def destroy
      @deal = Deal.friendly.find_by_slug(params[:id])
      super
    end
  end


end
