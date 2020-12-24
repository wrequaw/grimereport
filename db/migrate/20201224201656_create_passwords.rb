class CreatePasswords < ActiveRecord::Migration[6.0]
  def change
    create_table :passwords do |t|

      t.timestamps
    end
  end
end
