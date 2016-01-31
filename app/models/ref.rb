class Ref < ActiveRecord::Base
  has_many :assignments
  has_many :factures, through: :assignments

  validates :name, presence: true, uniqueness: true
end
