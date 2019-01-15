class Post < ApplicationRecord

  validates :title, presence: {message: 'タイトルを入力してください！'}
  validates :body, presence: {message: '本文を入力してください！'}, length: {minimum: 5, message: '5文字以上入力してください！'}

  attachment :image

  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :likes, dependent: :destroy


end
