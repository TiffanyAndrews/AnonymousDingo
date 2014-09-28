class CreateGoons < ActiveRecord::Migration
  def change
    create_table :goons do |t|
      t.string :phone

      t.timestamps
    end
  end
end
