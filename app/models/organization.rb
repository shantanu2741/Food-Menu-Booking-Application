class Organization < ApplicationRecord
  has_many :users
  has_many :menus, dependent: :destroy

end
