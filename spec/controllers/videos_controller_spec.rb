require 'rails_helper'

RSpec.describe EndUser::VideosController, type: :controller do
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

			it "new正常ログイン" do
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

			it "サインイン画面にリダイレクトされること" do
				get :new
				expect(response).to redirect_to "/end_users/sign_in"
			end
		end
	end

	describe "#show" do
		before do
			@user = FactoryBot.create(:end_user)
			@video = FactoryBot.create(:video,end_user_id: @user.id)
		end

		it "show正常アクセス" do
			get  :show, params: { id: @video.id }
			expect(response).to be_success
		end
	end

	describe "#create" do
		context "ログインユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
			end

			context "有効な属性値の場合" do
				it "動画の登録が出来ること" do #動画登録の際FFMPEGエラーが出る
					byebug
					video_params = FactoryBot.attributes_for(:video)
					sign_in @user
					expect{
						post :create, params: { video: video_params }
					}.to change(@user.videos, :count).by(1)
				end
			end

			context "無効な属性値の場合" do
				it "動画の登録が出来ないこと" do
					video_params = FactoryBot.attributes_for(:video)
					sign_in @user
					expect{
						post :create, params: { video: video_params }
					}.to_not change(@user.videos, :count)
				end
			end

			context "非ログインユーザの場合" do
				it "302レスポンスを返すこと" do
					video_params = FactoryBot.attributes_for(:video)
					get :create, params: { video: video_params}
					expect(response).to have_http_status "302"
				end

				it "サインイン画面にリダイレクトされること" do
					video_params = FactoryBot.attributes_for(:video)
					get :create, params: { video: video_params }
					expect(response).to redirect_to "/end_users/sign_in"
				end
			end
		end
	end

	describe "#update" do
		context "認可されたユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				@video = FactoryBot.create(:video,end_user_id: @user.id)
			end

			it "動画が更新出来ること" do
				video_params = FactoryBot.attributes_for(:video,title: "新規動画")
				sign_in @user
				patch :update, params: { id: @video.id,video: video_params }
				expect(@video.reload.title).to eq "新規動画"
			end
		end

		context "認可されてないユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				other_user = FactoryBot.create(:end_user, user_name: "n")
				@video = FactoryBot.create(:video, end_user_id: other_user.id, title: "テスト動画")
			end

			it "動画の更新ができないこと" do
				video_params = FactoryBot.attributes_for(:video,title: "新規動画")
				sign_in @user
				patch :update, params: { id: @video.id, video: video_params }
				expect(@video.reload.title).to eq "テスト動画"
			end

			it "トップページにリダイレクトされること" do
				video_params = FactoryBot.attributes_for(:video)
				sign_in @user
				patch :update, params: { id: @video.id, video: video_params }
				expect(response).to redirect_to end_user_root_path
			end
		end

		context "非ログインユーザの場合" do
			before do
				@video = FactoryBot.create(:video)
			end

			it "302レスポンスを返すこと" do
				video_params = FactoryBot.attributes_for(:video)
				patch :update, params: { id: @video.id, video: video_params }
				expect(response).to have_http_status "302"
			end

			it "サインイン画面にリダイレクトされること" do
				video_params = FactoryBot.attributes_for(:video)
				patch :update, params: {id:  @video.id, video: video_params}
				expect(response).to redirect_to "/end_users/sign_in"
			end
		end
	end

	describe "#destroy" do
		context "認可されたユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				@video = FactoryBot.create(:video, end_user_id: @user.id)
			end
			it "動画が削除出来ること" do
				sign_in @user
				expect{
					delete :destroy, params: { id: @video.id }
				}.to change(@user.videos, :count).by(-1)
			end
		end

		context "認可されてないユーザの場合" do
			before do
				@user = FactoryBot.create(:end_user)
				other_user = FactoryBot.create(:end_user, user_name: "n")
				@video = FactoryBot.create(:video, end_user_id: other_user.id)
			end

			it "動画が削除できないこと" do
				sign_in @user
				expect{
					delete :destroy, params: { id: @video.id }
				}.to_not change(Video, :count)
			end

			it "トップページにリダイレクトされること" do #エラー
				sign_in @user
				delete :destroy, params: { id: @video.id }
				expect(response).to redirect_to  end_user_root_path
			end
		end

		context "非ログインユーザの場合" do
			before do
				@video = FactoryBot.create(:video)
			end

			it "302レスポンスを返すこと" do
				delete :destroy, params: { id: @video.id }
				expect(response).to have_http_status "302"
			end

			it "サインイン画面にリダイレクトされること" do
				delete :destroy, params: { id: @video.id }
				expect(response).to redirect_to "/end_users/sign_in"
			end

			it "動画が削除出来ないこと" do #エラー
				delete :destroy, params: { id: @video.id }
				expect(response).to_not change(Video, :count)
			end
		end
	end
end
