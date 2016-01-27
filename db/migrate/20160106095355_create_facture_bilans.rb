class CreateFactureBilans < ActiveRecord::Migration
  def change
    create_table :facture_bilans do |t|
      t.float :m_HT
      t.float :m_tot_TTC
      t.float :m_tot_TVA
      t.float :m_topayed_TTC
      t.float :m_payed_TTC

      t.timestamps null: false
    end
  end
end
