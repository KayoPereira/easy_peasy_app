class Student < ApplicationRecord
  has_many :payments, dependent: :destroy
  validates :name, presence: true
  validates :monthly_lessons, presence: true
  validates :language, presence: true
  validates :level, presence: true
  enum :language, {
    english: 'English',
    spanish: 'Spanish',
    french: 'French',
    japanese: 'Japanese',
    korean: 'Korean',
    sign_language: 'Sign language',
    italian: 'Italian',
    portuguese: 'Portuguese',
    german: 'German'
  }

  enum :level, {
    basic_one: 'Basic 1',
    basic_two: 'Basic 2',
    basic_three: 'Basic 3',
    intermediary_one: 'Intermediary 1',
    intermediary_two: 'Intermediary 2',
    intermediary_three: 'Intermediary 3',
    advanced_one: 'Advanced 1',
    advanced_two: 'Advanced 2',
    advanced_three: 'Advanced 3'
  }
end
