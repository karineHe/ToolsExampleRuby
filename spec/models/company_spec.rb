require 'rails_helper'

describe Company do
  it "creates a contact with the company form" do
  @company = Company.new(
    name: "TEST",
    c_lname: "Farfelu",
    c_fname: "John",
    c_email: "test@gmail.com"
  )
  @company.create_contact
  @contact = Contact.last
  expect(@contact.company).to eq @company
  end
end
