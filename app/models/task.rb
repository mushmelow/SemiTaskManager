class Task < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :assign, class_name: "User", foreign_key: "assign_id"
  has_many :sub_tasks, class_name: "Task", foreign_key: "parent_id", dependent: :destroy
  belongs_to :parent, class_name: "Task", foreign_key: "parent_id", optional:true
  has_many :comments

  validates :author_id, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :assign, presence: true

  enum status: [ :cancelled, :in_progress, :completed, :waiting ]
end
