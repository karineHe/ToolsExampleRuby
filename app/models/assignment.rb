class Assignment < ActiveRecord::Base
  belongs_to :facture
  belongs_to :ref

  validates_presence_of :ref_id, :facture_id, :qty
  validates :qty, numericality: { greater_than_or_equal_to: 1 }
end
