class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :comment, presence: {message: '入力してください！'}
end
