class Response < ApplicationRecord
  belongs_to :user
  belongs_to :menu

  validates :response_date, presence: true
  validates :chapati_count, numericality: { only_integer: true, allow_nil: true, greater_than_or_equal_to: 0 }

  validates :user_id, uniqueness: { scope: :response_date, message: "has already submitted response for today" }

  attribute :chapati_count, :integer, default: 0
end
