class Task < ApplicationRecord
  belongs_to :user
  has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Task", foreign_key: "parent_id", optional:true


  validates :user_id, presence: true
  validates :task_name, presence: true
  validates :description, presence: true
end
