require 'rails_helper'

RSpec.describe Event,"モデル試験",type: :model do
	let(:event){ create(:event)}
	it "イベント登録 入力" do
		expect(event).to be_valid
	end
	#it "イベント登録　入力無" do
	#	expect().to be_valid
	#end

end
