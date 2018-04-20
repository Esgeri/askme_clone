class Question < ApplicationRecord
  belongs_to :user
  belongs_to :questioning_user, class_name: 'User', optional: true

  validates :text, :user, presence: true
  validates :text, length: { maximum: 255 }
end
