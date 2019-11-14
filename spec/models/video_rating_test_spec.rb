require 'rails_helper'

RSpec.describe VideoRating, type: :model do
  let(:video_rating){create(:video_rating)}
  it "動画評価試験" do
    expect(video_rating).to be_valid
  end

  it "コメントの文字数が0文字の場合" do
    video_rating = FactoryBot.build(:video_rating,comment: nil)
    video_rating.valid?
    expect(video_rating.errors[:comment]).to include("は0文字以上で入力してください")
  end
  it "コメントの文字数が300文字の場合" do
  	video_rating = FactoryBot.build(:video_rating,comment:
  		"あいうえおかきくけこさしすせそたちつてとなにぬ
ねのはひふへほまみむめもやゆよわをんあいうえおか
きくけこさしすせそたちつてとなにぬねのはひふへほ
まみむめもやゆよわをんあいうえおかきくけこさしす
せそたちつてとなにぬねのはひふへほまみむめもやゆ
よわをんあいうえおかきくけこさしすせそたちつてと
なにぬねのはひふへほまみむめもやゆよわをんあいう
えおかきくけこさしすせそたちつてとなにぬねのはひ
ふへほまみむめもやゆよわをんあいうえおかきくけこ
さしすせそたちつてとなにぬねのはひふへほまみむめ
もやゆよわをんあいうえおかきくけこさしすせそたち
つてとなにぬねのはひふへほまみむめもやゆよわをんあい")
  	expect(video_rating).to be_valid
  end
  it "コメントの文字数が301文字の場合 エラー" do
  	video_rating = FactoryBot.build(:video_rating,comment:
  		"あいうえおかきくけこさしすせそたちつてとなにぬ
ねのはひふへほまみむめもやゆよわをんあいうえおか
きくけこさしすせそたちつてとなにぬねのはひふへほ
まみむめもやゆよわをんあいうえおかきくけこさしす
せそたちつてとなにぬねのはひふへほまみむめもやゆ
よわをんあいうえおかきくけこさしすせそたちつてと
なにぬねのはひふへほまみむめもやゆよわをんあいう
えおかきくけこさしすせそたちつてとなにぬねのはひ
ふへほまみむめもやゆよわをんあいうえおかきくけこ
さしすせそたちつてとなにぬねのはひふへほまみむめ
もやゆよわをんあいうえおかきくけこさしすせそたち
つてとなにぬねのはひふへほまみむめもやゆよわをんあいう")
  	video_rating.valid?
  	expect(video_rating.errors[:comment]).to include("は300文字以内で入力してください")
  end
end
