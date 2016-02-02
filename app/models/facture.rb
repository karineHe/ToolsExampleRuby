class Facture < ActiveRecord::Base
  has_many :assignments, dependent: :destroy
  has_many :refs, through: :assignments
  belongs_to :company
  belongs_to :contact

  before_save :set_p

  attr_accessor :comp_name, :lname

  def set_dest
    if self.company
      return self.company.name
    else
      if self.contact
        return "#{self.contact.lname} #{self.contact.fname}"
      end
    end
  end

  def get_client_addr
    if self.company
      self.company.address
    else
      if self.contact
        self.contact.address
      end
    end
  end

  def ref_array
    refs = []
      self.assignments.each do |a|
        if a.ref_id != nil
          refs << [Ref.find(a.ref_id), a.qty]
        end
      end
    refs
  end

  def comp_empty?
    !(self.comp_name)
  end

  def contact_empty?
    if self.lname
      false
    end
    true
  end

  def change_status
    self.status = "Payée"
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
