FactoryBot.define do
  factory :video_rating do
    rate{ 3.5 }
    comment{"テスト"}
    association :end_user
    association :video
  end
end
