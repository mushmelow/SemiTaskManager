class User < ApplicationRecord
  has_many :assignments
  has_many :roles, through: :assignments
  has_many :comments

  has_many :tasks
  has_many :assign_tasks, class_name: "Task", foreign_key: "assign_id"

  before_save { self.email = email.downcase }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, length: {maximum: 225},
            format:{ with: VALID_EMAIL_REGEX }

  def is_admin?
   return self.roles.map{|role| role.name }.include?("admin")
  end

end