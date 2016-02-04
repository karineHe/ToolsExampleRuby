class Ref < ActiveRecord::Base
  has_many :assignments
  has_many :factures, through: :assignments

  validates :name, presence: true, uniqueness: true

  def total_ttc(qty)
    coeff = 0

    case self.tva
    when 20
      coeff = 1.2
    when 10
      coeff = 1.1
    when 5.5
      coeff = 1.055
    when 2.1
      coeff = 1.021
    end

    self.pu_ht * qty * coeff
  end
end
