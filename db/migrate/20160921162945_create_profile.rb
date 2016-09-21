class CreateProfile < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.column :name, :string
      t.column :age, :integer
      t.references :user, index: true
      t.timestamps

    end
  end
end
