FactoryBot.define do
  factory :reply_comment do
    comment{"テスト"}
    association :video_rating
    association :end_user
  end
end
