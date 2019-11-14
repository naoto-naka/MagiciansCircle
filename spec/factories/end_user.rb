FactoryBot.define do
	factory :end_user do
		sequence(:email) { |n| "c#{n}@c" }
		password { "123456" }
		user_name { 'l' }
	end
end