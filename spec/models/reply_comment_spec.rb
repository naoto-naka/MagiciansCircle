require 'rails_helper'

RSpec.describe ReplyComment, type: :model do
  let(:reply_comment){ create(:reply_comment) }
  it "返信コメント 入力" do
  	expect(reply_comment).to be_valid
  end
  it "コメントの文字数が0文字の場合 エラー" do
  	reply_comment = FactoryBot.build(:reply_comment,comment: "")
  	reply_comment.valid?
  	expect(reply_comment.errors[:comment]).to include("は1文字以上で入力してください")
  end
  it "コメントの文字数が1文字の場合" do
  	reply_comment = FactoryBot.build(:reply_comment,comment: "あ")
  	expect(reply_comment).to be_valid
  end
  it "コメントの文字数が300文字の場合" do
  	reply_comment = FactoryBot.build(:reply_comment,comment: "あ" * 300 )
  	expect(reply_comment).to be_valid
  end
  it "コメントの文字数が301文字の場合 エラー" do
  	reply_comment = FactoryBot.build(:reply_comment,comment: "あ" * 301)
  	reply_comment.valid?
  	expect(reply_comment.errors[:comment]).to include("は300文字以内で入力してください")
  end

end
