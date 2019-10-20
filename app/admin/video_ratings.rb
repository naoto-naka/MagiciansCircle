ActiveAdmin.register VideoRating do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :rate, :comment, :end_user_id, :video_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:rate, :comment, :end_user_id, :video_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :rate, :comment, :end_user_id, :video_id
end
