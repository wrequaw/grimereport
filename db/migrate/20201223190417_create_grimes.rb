class CreateGrimes < ActiveRecord::Migration[6.0]
  def change
    create_table :grimes do |t|
      t.string :title
      t.text :description
      t.integer :griminess
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
