class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :store
      t.float :price
      t.string :amount

      t.timestamps
    end
  end
end
