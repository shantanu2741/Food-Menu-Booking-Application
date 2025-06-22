class Menu < ApplicationRecord
  belongs_to :organization
  has_many :responses, dependent: :destroy

  validates :description, presence: true
  validates :menu_date, presence: true, uniqueness: { scope: :organization_id }

  def submission_open?
    created_at >= 2.hours.ago
  end
end
