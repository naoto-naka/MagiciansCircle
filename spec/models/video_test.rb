require 'rails_helper'

RSpec.describe Video,"モデル試験",type: :model do
	let(:video){ create(:video)}
	it "動画アップロード試験 " do
		expect(video).to be_valid
	end
	it "タイトルの文字数が0文字の時 エラー" do
		video = FactoryBot.build(:video,title: "")
		video.valid?
		expect(video.errors[:title]).to include("は1文字以上で入力してください")
	end
	it "タイトルの文字数が１文字の時" do
		video = FactoryBot.build(:video,title: "あ")
		video.valid?
		expect(video).to be_valid
	end
	it "タイトルの文字数が30文字の時" do
		video = FactoryBot.build(:video,title: "あ" * 30)
		video.valid?
		expect(video).to be_valid
	end
	it "タイトルの文字数が31文字の時 エラー" do
		video = FactoryBot.build(:video,title: "あ" * 31)
		video.valid?
		expect(video.errors[:title]).to include("は30文字以内で入力してください")
	end
	it "説明文の文字数が0文字の時" do
		video = FactoryBot.build(:video,description: "")
		video.valid?
		expect(video).to be_valid
	end
	it "説明文の文字数が800文字の時" do
		video = FactoryBot.build(:video,description: "あ" * 800)
		video.valid?
		expect(video).to be_valid
	end
	it "説明文の文字数が801文字の時" do
		video = FactoryBot.build(:video,description: "あ" * 801)
		video.valid?
		expect(video.errors[:description]).to include("は800文字以内で入力してください")
	end
	it "ビデオが未登録の場合 エラー" do
		video = FactoryBot.build(:video,video: nil)
		video.valid?
		expect(video.errors[:video]).to include("を入力してください")
	end

end