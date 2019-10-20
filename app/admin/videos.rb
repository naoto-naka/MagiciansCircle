ActiveAdmin.register Video do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :video, :description, :category_id, :end_user_id, :tag_id, :label_list, :tag_list
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :video, :description, :category_id, :end_user_id, :tag_id, :label_list, :tag_list]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :video, :description, :category_id, :end_user_id, :tag_id

  index do
    column :title
    column :id
    column :video do |video|
      image_tag(video.video_url(:screenshot),width: 300, alt: "screenshot") unless video.video_url.nil?
    end
    column :category
    column :end_user
    column :tag
    column :description
    actions
  end

   show do |video|
    attributes_table do
      row :title
      row :video do
         video_tag video.video_url.to_s,loop: true, controls: true, width: 300, id: "mv"  unless video.video_url.nil?
      end
      row :description
      row :category
      row :end_user
      row :tag
    end
  end
end
