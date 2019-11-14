require 'rails_helper'

RSpec.describe EndUser,"モデル試験",type: :model do
	let(:end_user){ create(:end_user)}
	it 'エンドユーザ会員登録試験' do
      expect(end_user).to be_valid
    end
    it 'ユーザネーム未入力の場合 エラー' do
      end_user = FactoryBot.build(:end_user,user_name: nil)
      end_user.valid?
      expect(end_user.errors[:user_name]).to include("を入力してください")
    end
    it 'Email未入力の場合 エラー' do
    	end_user = FactoryBot.build(:end_user,email: nil)
    	end_user.valid?
    	expect(end_user.errors[:email]).to include("を入力してください")
    end
end