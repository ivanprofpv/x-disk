class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.integer :space, default: 10485760
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
