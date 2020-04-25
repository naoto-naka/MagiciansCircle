require 'rails_helper'

RSpec.describe EndUser::RegistrationsController, type: :controller do
	describe "#myvideos" do
	    it "正常アクセス" do
		    get :myvideos
		    expect(response).to be_success
	    end

	    it "200レスポンスを返すこと" do
		    get :myvideos
		    expect(response).to have_http_status "200"
	    end
    end
end
