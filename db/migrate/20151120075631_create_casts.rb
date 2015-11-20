class CreateCasts < ActiveRecord::Migration
  def change
    create_table :casts do |t|
      t.string :name
      t.integer :age
      t.integer :b
      t.integer :w
      t.integer :hip
      t.string :cup
      t.string :message
      t.string :comment
      t.integer :tall

      t.timestamps null: false
    end
  end
end
