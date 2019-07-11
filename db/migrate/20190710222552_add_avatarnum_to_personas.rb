class AddAvatarnumToPersonas < ActiveRecord::Migration[6.0]
  def change
    add_column :personas, :avatarnum, :integer
  end
end
