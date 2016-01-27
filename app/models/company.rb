class Company < ActiveRecord::Base
  attr_accessor :c_lname, :c_fname, :c_email
  has_many :contacts
  has_many :factures

  after_create :create_contact
  after_update :create_contact

  def create_contact
    if self.c_fname || self.c_lname || self.c_email
      @contact = Contact.new
      @contact.lname = self.c_lname
      @contact.fname = self.c_fname
      @contact.email = self.c_email
      @contact.company = self
      @contact.save
    end
  end
end
