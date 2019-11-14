require 'rails_helper'

RSpec.describe Event,"モデル試験",type: :model do
	let(:event){ create(:event)}
	it "イベント登録 入力" do
		expect(event).to be_valid
	end
	it "タイトルが未入力の場合エラー" do
		event = FactoryBot.build(:event,title: nil)
		event.valid?
		expect(event.errors[:title]).to include("を入力してください")
	end
	it "開始日時が未入力の場合エラー" do
		event = FactoryBot.build(:event,start: nil)
		event.valid?
		expect(event.errors[:start]).to include("を入力してください")
	end
	it "終了日時が未入力の場合エラー" do
		event = FactoryBot.build(:event,end: nil)
		event.valid?
		expect(event.errors[:end]).to include("を入力してください")
	end
	it "参加費が未入力の場合エラー" do
		event = FactoryBot.build(:event,fee: nil)
		event.valid?
		expect(event.errors[:fee]).to include("を入力してください")
	end
	it "会場が未入力の場合エラー" do
		event = FactoryBot.build(:event,venue: nil)
		event.valid?
		expect(event.errors[:venue]).to include("を入力してください")
	end
	it "住所が未入力の場合エラー" do
		event = FactoryBot.build(:event,address: nil)
		event.valid?
		expect(event.errors[:address]).to include("を入力してください")
	end
	it "説明文が未入力の場合エラー" do
		event = FactoryBot.build(:event,description: nil)
		event.valid?
		expect(event.errors[:description]).to include("を入力してください")
	end
	it "アクセスが未入力の場合エラー" do
		event = FactoryBot.build(:event,access: nil)
		event.valid?
		expect(event.errors[:access]).to include("を入力してください")
	end

end
