class RenameProfiles < ActiveRecord::Migration[5.0]
  def change
    rename_table :profiles, :user_profiles
  end
end
