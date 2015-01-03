ActiveAdmin.register Category do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :description
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
      f.input :name
      #f.input :category_photo, :as => :file, :hint => f.template.image_tag(f.object.category_photo.url)
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
