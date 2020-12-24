class AddFieldsToPasswords < ActiveRecord::Migration[6.0]
  def change
    add_column :passwords, :password, :string
  end
end
