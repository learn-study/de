class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :cast, index: true, foreign_key: true
      t.string :pr_item
      t.string :pr_body
      t.integer :pr_no

      t.timestamps null: false
    end
  end
end
