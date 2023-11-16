ActiveAdmin.register Course do

  permit_params :name, :description, :price, :image, pdf_ids: []
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :price, :description, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :description, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

end
