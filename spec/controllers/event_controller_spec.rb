require 'rails_helper'

RSpec.describe EndUser::EventsController, type: :controller do
	describe "#index" do
		it "index正常アクセス" do
			get :index
			expect(response).to be_success
		end

		it "200レスポンスを返すこと" do
			get :index
			expect(response).to have_http_status "200"
		end
	end

	describe "#new" do
		context "ログインユーザの場合" do
		    before do
			  @user = FactoryBot.create(:end_user)
		    end

			it "new正常アクセス" do
			  sign_in @user
			  get :new
			  expect(response).to be_success
			end

			it "200レスポンスを返すこと" do
			  sign_in @user
			  get :new
			  expect(response).to have_http_status "200"
			end
		end

        context "非ログインユーザの場合" do
		    it "302レスポンスを返すこと" do
		    	get :new
		    	expect(response).to have_http_status "302"
		    end

		    it "サインイン画面にリダイレクトすること" do
		    	get :new
		    	expect(response).to redirect_to "/end_users/sign_in"
		    end

	    end
	end

	describe "#show" do
		before do
			@user = FactoryBot.create(:end_user)
			@event = FactoryBot.create(:event, end_user_id: @user)
		end

		it "show正常アクセス" do
			get :show, params: { id: @event.id }
			expect(response).to be_success
		end
	end

	describe "#create" do
		context "ログインユーザの場合" do
			before do
		   	    @user = FactoryBot.create(:end_user)
		    end

		    it "イベントの登録が出来ること" do
		    	event_params = FactoryBot.attributes_for(:event)
		        sign_in @user
		        expect{
		          post :create, params: { event: event_params }
		        }.to change(@user.event, :count).by(1)
		    end
		end

		context "非ログインユーザの場合" do
			it "302レスポンスを返すこと" do
			    event_params = FactoryBot.attributes_for(:event)
			    post :create, params: { event: event_params }
			    expect(response).to have_http_status "302"
			end

			it "サインイン画面にリダイレクトすること" do
				event_params = FactoryBot.attributes_for(:event)
				post :create, params: { event: event_params }
				expect(response).to redirect_to "/end_users/sign_in"
			end
		end
	end

end
