require 'rails_helper'

describe Contact do
  it "is valid with a lastname, a firstname and an email" do
    contact = Contact.new(
      lname: 'Doe',
      fname: 'John',
      email: 'jdoe@gmail.com')
    contact.valid?
    expect(contact).to be_valid
  end

  describe "invalid without: " do
    after :each do
      @contact.valid?
      expect(@contact.errors[:lname]).to include("can't be blank")
    end
    it "a lastname" do
      @contact = Contact.new(lname: nil)
    end
    it "a firstname" do
      @contact = Contact.new(fname: nil)
    end
    it "an email" do
      @contact = Contact.new(email: nil)
    end
  end

    it "is invalid with a duplicate email" do
      Contact.create(
        lname: 'Doe',
        fname: 'John',
        email: 'tester@gmail.com')
      contact = Contact.new(
        lname: 'Doe',
        fname: 'Jane',
        email: 'tester@gmail.com')
      contact.valid?
      expect(contact.errors[:email]).to include("has already been taken")
  end

    describe "test display" do
      before :each do
        @contact = Contact.new(
          lname: 'Doe',
          fname: 'John',
          email: 'jdoe@gmail.com')
      end

      context "show company when set" do
        it "shows ##### when company is nil" do
          @contact.company = nil
          expect(@contact.show_comp).to eq "#####"
        end

        it "shows company name when company is not nil" do
          @comp = Company.create(
            name: "TEST")
          @contact.company = @comp
          expect(@contact.show_comp).to eq "TEST"
        end
      end

      context "shows good phone number if set" do

        it "shows nil when both number are nil" do
          @contact.phone, @contact.cell = nil
          expect(@contact.show_phone).to eq ""
        end
        it "shows cell number if not nil when phone number is nil " do
          @contact.phone = nil
          @contact.cell = "0657483920"
          expect(@contact.show_phone).to eq "0657483920"
        end
        it "shows phone when cell is nil" do
          @contact.phone = "0143564738"
          @contact.cell = nil
          expect(@contact.show_phone).to eq "0143564738"
        end

        it "shows phone when cell is set" do
          @contact.phone = "0143564738"
          @contact.cell = "0657483920"
          expect(@contact.show_phone).to eq "0143564738"
        end
      end
    end
end
