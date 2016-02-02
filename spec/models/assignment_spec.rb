require 'rails_helper'

describe Assignment do
  it "is valid with a ref_id and facture_id" do
    f = Facture.create()
    ref = Ref.create(name: "TEST01")
    a = Assignment.new(
      ref_id: ref.id,
      facture_id: f.id
    )
    a.valid?
    expect(a).to be_valid
  end

  it "is invalid without ref_id" do
    f = Facture.create()
    a = Assignment.create(
      ref_id: nil,
      facture_id: f.id
    )
    a.valid?
    expect(a.errors[:ref_id]).to include("can't be blank")
  end

  it "is invalid without facture_id" do
    ref = Ref.create(name: "TEST01")
    a = Assignment.new(
      ref_id: ref.id,
      facture_id: nil
    )
    a.valid?
    expect(a.errors[:facture_id]).to include("can't be blank")
  end

end
