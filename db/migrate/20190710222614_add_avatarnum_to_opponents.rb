class AddAvatarnumToOpponents < ActiveRecord::Migration[6.0]
  def change
    add_column :opponents, :avatarnum, :integer
  end
end
