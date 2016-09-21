class CreateDates < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.string :work
      t.string :social
      t.string :education
      t.string :health
      t.references :user, index: true

      t.timestamps
    end
  end
end
