FactoryBot.define do
	factory :video do
		title{"テスト"}
		video{Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/video/Traffic - 27260.mp4'))}
		limit{"公開"}
		description{"テスト"}
		association :end_user
		association :category
	end

	factory :category do
		category_name{"イリュージョン"}
	end
end