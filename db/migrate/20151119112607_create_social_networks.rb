class CreateSocialNetworks < ActiveRecord::Migration
  def change
    create_table :social_networks do |t|
      t.string :twitter
      t.string :facebook
      t.string :linkedIn
      t.string :viadeo

      t.timestamps null: false
    end
  end
end
