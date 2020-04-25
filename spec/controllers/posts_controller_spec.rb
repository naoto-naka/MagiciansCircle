require 'rails_helper'

RSpec.describe EndUser::PostsController, type: :controller do
	describe "#top" do
		it "正常アクセス" do
			get :top
			expect(response).to be_success
		end

		it "200レスポンスを返すこと" do
			get :top
			expect(response).to have_http_status "200"
		end
	end

	describe "#about" do
		it "正常アクセス" do
		    get :about
		    expect(response).to be_success
	    end

	    it "200レスポンスを返すこと" do
	    	get :about
	    	expect(response).to have_http_status "200"
	    end
	end
end
