class ChangeTableName < ActiveRecord::Migration
  def change
    rename_table :goons, :goon
  end
end
