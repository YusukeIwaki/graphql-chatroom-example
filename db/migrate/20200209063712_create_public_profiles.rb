class CreatePublicProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :public_profiles do |t|
      t.references :user, null: false, index: { unique: true }
      t.string :display_name, null: false, index: { unique: true }
      t.string :github, null: true
      t.string :email, null: true
      t.timestamps
    end
  end
end
