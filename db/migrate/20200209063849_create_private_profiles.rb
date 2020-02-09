class CreatePrivateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :private_profiles do |t|
      t.references :user, null: false, index: { unique: true }
      t.string :email, null: false, index: { unique: true }
      t.string :real_name, null: false
      t.timestamps
    end
  end
end
