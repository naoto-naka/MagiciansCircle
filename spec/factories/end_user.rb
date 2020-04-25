FactoryBot.define do
	factory :end_user do
		sequence(:email) { |n| "c#{n}@c" }
		password { "123456" }
		sequence(:user_name) { |n| "山田太郎#{n}" }
	end
end