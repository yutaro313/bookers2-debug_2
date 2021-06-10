class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy

	# 今日投稿されたPostを取得
	scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
	# 機能投稿されたPostを取得
	scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
	# 今週に投稿されたPostを取得
	scope :created_this_week, -> { where(created_at: 6.day.ago.beginning_of_day..Time.zone.now.end_of_day) }
	# 先週に投稿されたPostを取得
	scope :created_last_week, -> { where(created_at: 2.week.ago.beginning_of_day..1.week.ago.end_of_day) }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
