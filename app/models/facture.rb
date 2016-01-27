class Facture < ActiveRecord::Base
  has_many :assignments
  has_many :refs, through: :assignments
  belongs_to :company
  belongs_to :contact

  before_save :set_p

  attr_accessor :comp_name, :lname

  def set_dest
    if self.company
      return self.company.name
    else
      return "#{self.contact.lname} #{self.contact.fname}"
    end
  end

  def comp_empty?
    if self.comp_name
      false
    end
    true
  end

  def contact_empty?
    if self.lname
      false
    end
    true
  end

  def sum_m_HT
  end

  def sum_tot_TTC
  end

  def tot_TVA
  end

  def m_unpaid
  end

  def m_paid
  end

  private

  def set_p
    if self.comp_name
      company = Company.where(name: self.comp_name).limit(1)
      self.company = company[0]
    end
    if self.lname
      contact = Contact.where(lname: self.lname).limit(1)
      self.contact = contact[0]
    end
    self.status = "A payer"
  end

end
