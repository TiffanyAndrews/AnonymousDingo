class RenameGoonsAgain < ActiveRecord::Migration
  def change
    rename_table :goon, :goons
  end
end
