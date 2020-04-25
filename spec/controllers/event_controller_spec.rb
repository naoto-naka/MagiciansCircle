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
			@event = FactoryBot.create(:event, end_user_id: @user.id)
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

		    context "有効な属性値の場合" do
			    it "イベントの登録が出来ること" do
			    	event_params = FactoryBot.attributes_for(:event)
			        sign_in @user
			        expect{
			            post :create, params: { event: event_params }
			        }.to change(@user.events, :count).by(1)
			    end
			end

			context "無効な属性値の場合" do
				it "イベントの登録が出来ないこと" do
					event_params = FactoryBot.attributes_for(:event, :invalid)
					sign_in @user
					expect{
						post :create, params: { event: event_params }
					}.to_not change(@user.events, :count)
				end
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

	describe "#update" do
		context "認可されたユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				@event = FactoryBot.create(:event, end_user_id: @user.id)
			end

			it "イベントを更新出来ること" do
				event_params = FactoryBot.attributes_for(:event, title: "新規イベント")
				sign_in @user
				patch :update, params: { id: @event.id, event: event_params }
				expect(@event.reload.title).to eq "新規イベント"
			end
		end

		context "認可されていないユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				other_user = FactoryBot.create(:end_user, user_name: "m")
				@event = FactoryBot.create(:event, end_user_id: other_user.id, title: "試験")
			end

			it "イベント更新ができないこと" do
				event_params = FactoryBot.attributes_for(:event,title: "新規テスト")
				sign_in @user
				patch :update, params: { id: @event.id, evnet: event_params }
				expect(@event.reload.title).to eq "試験"
			end

			it "トップページへリダイレクトされること" do
				event_params = FactoryBot.attributes_for(:event)
				sign_in @user
				patch :update, params: { id: @event.id, event: event_params }
				expect(response).to redirect_to end_user_root_path
			end
		end

		context "非ログインユーザの場合" do
			before do
				@event = FactoryBot.create(:event)
			end

			it "302レスポンスを返すこと" do
				event_params = FactoryBot.attributes_for(:event)
				patch :update, params: { id: @event.id, evnet: event_params }
				expect(response).to have_http_status "302"
			end

			it "サインイン画面にリダイレクトされること" do
				event_params = FactoryBot.attributes_for(:event)
				patch :update, params: { id: @event.id, event: event_params }
				expect(response).to redirect_to "/end_users/sign_in"
			end
		end
	end

	describe "#destroy" do
		context "認可されたユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				@event = FactoryBot.create(:event, end_user_id: @user.id)
			end

		    it "イベントを削除できること" do
			    sign_in @user
			    expect{
			        delete :destroy, params: { id:@event.id }
			    }.to change(@user.events, :count).by(-1)
		    end
		end

		context "認可されてないユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				other_user = FactoryBot.create(:end_user, user_name: "m")
				@event = FactoryBot.create(:event, end_user_id: other_user.id)
			end

			it "イベントを削除できないこと" do
				sign_in @user
				expect{
					delete :destroy, params: { id: @event.id }
				}.to_not change(Event, :count)
			end

			it "トップページへリダイレクトされること" do
				sign_in @user
				delete :destroy, params: { id: @event.id }
				expect(response).to redirect_to end_user_root_path
			end
		end

		context "非ログインユーザの場合" do
			before do
				@event = FactoryBot.create(:event)
			end

			it "302レスポンスを返すこと" do
				delete :destroy, params: { id: @event.id }
				expect(response).to have_http_status "302"
			end

			it "サインイン画面にリダイレクトされること" do
				delete :destroy, params: { id: @event.id }
				expect(response).to redirect_to "/end_users/sign_in"
			end

			it "イベントを削除できないこと" do
				expect{
					delete :destroy, params: { id: @event.id }
				}.to_not change(Event, :count)
			end
		end
	end
end
