require 'rails_helper'

describe Ref do
  it "is valid with a name" do
    ref = Ref.new(
      name: 'Jane')
    expect(ref).to be_valid
  end

  it "is invalid without a name" do
    ref = Ref.new(
      name: nil)
    ref.valid?
    expect(ref.errors[:name]).to include ("can't be blank")
  end

  it "is invalid with a duplicate name" do
    Ref.create(name: 'Jane')
    ref = Ref.new(name: 'Jane')
    ref.valid?
    expect(ref.errors[:name]).to include ("has already been taken")
  end
end
