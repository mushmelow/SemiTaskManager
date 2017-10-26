class Task < ApplicationRecord
  belongs_to :user
  has_many :sub_task, dependent: :destroy


  validates :user_id, presence: true
  validates :description, presence: true
end
