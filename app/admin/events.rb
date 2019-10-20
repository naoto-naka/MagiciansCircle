ActiveAdmin.register Event do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :start, :end, :fee, :address, :description, :end_user_id, :image
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :start, :end, :fee, :address, :description, :end_user_id, :image]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :title, :fee, :start_date, :start_time_hour, :start_time_minute, :end_date, :end_time_hour, :end_time_minute, :address, :description, :end_user_id, :image

  index do
    column :id
    column :image do |event|
      image_tag event.image.thumb.url unless event.image.thumb.url.nil?
    end
    column :title
    column :start
    column :end
    column :fee
    column :address
    column :description
    column :end_user_id
    actions
  end

  form do |f|
    f.inputs do
      f.input :title, label: "タイトル"
      f.input :start, as: :just_datetime_picker, label: "開始日時"
      f.input :end, as: :just_datetime_picker, label: "終了日時"
      f.input :fee, label: "料金"
      f.input :venue, label: "開催地"
      f.input :address, label: "住所"
      f.input :description, label: "説明"
      f.input :access, label: "アクセス"
      f.input :official_site, label: "オフィシャルサイト(URL)"
      f.input :image, label: "画像"
    end
    f.actions
  end


  show do |event|
    attributes_table do
      row :title
      row :start
      row :end
      row :fee
      row :address
      row :description
      row :end_user_id
      row :image do
        image_tag event.image.thumb.url unless event.image.thumb.url.nil?
      end
    end
  end
end
