module ActsAsTaggableOn
  class Tag < ::ActiveRecord::Base
  	has_many :videos
    validates :name, length: { in: 1..15 }
  end
end