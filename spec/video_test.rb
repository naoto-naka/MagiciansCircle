require 'rails_helper'

RSpec.describe Video,"モデル試験",type: :model do
	let(:video){ create(:video)}
	it "動画アップロード試験 " do
		expect(video).to be_valid
	end
end