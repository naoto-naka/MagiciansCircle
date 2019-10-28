FactoryBot.define do
	factory :video do
		title{"テスト"}
		video{ fixture_file_upload("#{::Rails.root}/spec/fixtures/video/Traffic - 27260.mp4","video/mp4") }
		limit{"公開"}
		description{"テスト"}
		association :end_user
		association :category
	end

	factory :category do
		category_name{"イリュージョン"}
	end
end