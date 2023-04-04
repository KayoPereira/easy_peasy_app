class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # has_many :wordings
  enum :role, {
    admin: 'Admin',
    teacher: 'Professor',
    student: 'Aluno'
  }
end
