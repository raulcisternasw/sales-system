class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.text :description
      t.decimal :total_amount
      t.boolean :is_active

      t.timestamps
    end
  end
end
