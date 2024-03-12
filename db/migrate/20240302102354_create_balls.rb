class CreateBalls < ActiveRecord::Migration[6.1]
  def change
    create_table :balls do |t|
      t.string :rule
      t.string :genre
      t.text :about

      t.timestamps
    end
  end
end
