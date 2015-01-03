ActiveAdmin.register Category do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description, :photo_url
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :id
    column :name
    column "Image" do |category|
      image_tag(category.photo_url.url,:width => '100', :height => '100')
    end
    column :description
    actions
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs "Details" do
      f.input :name
      f.input :photo_url, :as => :file, :hint => f.template.image_tag(f.object.photo_url.url)
      f.input :description
    end
    f.actions
  end

  controller do
    def show
      @category = Category.friendly.find_by_slug(params[:id])
    end

    def edit
      @category = Category.friendly.find_by_slug(params[:id])
    end

    def update
      @category = Category.friendly.find_by_slug(params[:id])
      super
    end

    def destroy
      @category = Category.friendly.find_by_slug(params[:id])
      super
    end
  end


end
