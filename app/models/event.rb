class Event < ApplicationRecord
  mount_uploader :image, ImageUploader
  just_define_datetime_picker :start
  just_define_datetime_picker :end
  validates :title, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :fee, presence: true
  validates :venue, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :access, presence: true
end
