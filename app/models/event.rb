class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  just_define_datetime_picker :start
  just_define_datetime_picker :end
end
