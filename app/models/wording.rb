class Wording < ApplicationRecord
  # belongs_to :user

  enum :level, {
    beginner: 'Iniciante',
    intermediary: 'Intermediário',
    advanced: 'Avançado'
  }
end
