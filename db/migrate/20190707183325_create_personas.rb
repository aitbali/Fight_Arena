class CreatePersonas < ActiveRecord::Migration[6.0]
  def change
    create_table :personas do |t|
      t.string :name
      t.integer :pv
      t.integer :pa

      t.timestamps
    end
  end
end
