class CreateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :reports do |t|
      t.text :decription
      t.belongs_to :persona, index: true

      t.timestamps
    end
  end
end
