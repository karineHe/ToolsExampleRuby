class Assignment < ActiveRecord::Base
  belongs_to :facture
  belongs_to :ref
end
