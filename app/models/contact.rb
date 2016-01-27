class Contact < ActiveRecord::Base
  validates_presence_of :lname, :fname, :email
  validates_uniqueness_of :email
  belongs_to :company
  has_many :factures

  def show_phone
    if (self.phone == nil) && (self.cell == nil)
      return ""
    else
      if !(self.phone.empty?)
        self.phone
      else
        self.cell
      end
    end
  end

  def show_comp
    if self.company == nil
      return "#####"
    else
      c = Company.find(self.company)
      c.name
    end
  end
end
