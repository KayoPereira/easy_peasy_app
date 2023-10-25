class Payment < ApplicationRecord
  belongs_to :student
  validates :price, presence: true
  validates :month, presence: true
  enum :month, {
    january: "January",
    february: "February",
    march: "March",
    april: "April",
    may: "May",
    june: "June",
    july: "July",
    august: "August",
    september: "September",
    october: "October",
    november: "November",
    december: "December"
  }
end
