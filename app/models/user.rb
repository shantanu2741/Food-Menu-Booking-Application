class User < ApplicationRecord
  before_validation :set_default_organization

  ROLES = %w[admin employee].freeze #immutable (beacuse of freeze) array role,which contain only admin or employee
  has_many :responses, dependent: :destroy

  validates :role, presence: true, inclusion: { in: ROLES }

  belongs_to :organization

  def set_default_organization
    self.organization_id ||= 1
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == "admin"
  end

  def employee?
    role == "employee"
  end
  
  def generate_login_token!
    self.login_token = SecureRandom.hex(20)
    self.login_token_sent_at = Time.current
    save!
  end

  def login_token_valid?
    login_token_sent_at && login_token_sent_at > 2.hours.ago
  end

  def clear_login_token!
    update(login_token: nil, login_token_sent_at: nil)
  end
end
