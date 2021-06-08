class Book < ApplicationRecord
	belongs_to :user
	has_many :favorites, dependent: :destroy
	has_many :favorited_users, through: :favorites, source: :user
	has_many :comments, dependent: :destroy

	# 今日投稿されたPostを取得
	scope :today, -> { where(created_at: Time.current.all_day).count }
	# 機能投稿されたPostを取得
	scope :yesterday, -> { where(created_at: Time.zone.yesterday.all_day).count }
	# 今週に投稿されたPostを取得
	scope :this_week, -> { where(created_at: Time.current.all_week).count }
	# 先週に投稿されたPostを取得
	scope :last_week, -> { where(created_at: Time.current.last_week.all_week).count }

	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
