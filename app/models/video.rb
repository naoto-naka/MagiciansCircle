 class Video < ApplicationRecord
  belongs_to :category
  belongs_to :tag, optional: true
  belongs_to :end_user
  has_many :video_ratings, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :end_users, through: :favorites
  #accepts_nested_attributes_for :category
  mount_uploader :video, VideoUploader
  acts_as_taggable_on :labels
  acts_as_taggable

  enum limit:{公開:0, プライベート:1}

  validates :title, length: {in: 1..30}
  validates :description, length: {in:0..800}
  validates :video, presence: true

  def search_videos(params_q,params_page)
    q = params_q
    search_videos = Video.ransack(title_or_description_cont: q).result.page(params_page).per(10)
    search_tags = Tag.ransack(name_cont: q).result
    search_tags.each do |search_tag|
      search_videos = Video.tagged_with(search_tag.name).page(params_page).per(10)
    end
    search_category = Category.ransack(category_name_cont: q).result
    search_category.each do |search_category|
      search_videos = search_category.videos.page(params_page).per(10)
    end
    search_users = EndUser.ransack(user_name_cont: q).result
    search_users.each do |search_user|
      search_videos = search_user.videos.page(params_page).per(10)
    end
    return search_videos
  end

  def narrow_down_video(params_video,search_videos)
    if params_video == "rate"
        return narrow_down_videos = search_videos.sort_by{|video| video.video_ratings.sum(:rate)}.reverse
      elsif params_video == "new"
        return narrow_down_videos = search_videos.order(created_at: :desc)
      elsif params_video == "play"
        return narrow_down_videos = search_videos.order(views: :desc)
      end
    end
 end
