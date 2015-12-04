class Post < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true, length: { in: 5..50 }
  validates :body,  presence: true, length: { in: 5..500 }
end
