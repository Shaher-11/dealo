class CreateDealGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :deal_groups do |t|
      t.references :deal, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
