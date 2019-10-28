require 'rails_helper'

RSpec.describe EndUser,"モデル試験",type: :model do
	let(:end_user){ create(:end_user)}
	it 'エンドユーザ会員登録試験' do
      expect(end_user).to be_valid
    end
    it 'エンドユーザログイン試験' do
    	login_as(end_user)
    	get end_user_root_path
    	expect(response).to have_http_status(200)
    end
end