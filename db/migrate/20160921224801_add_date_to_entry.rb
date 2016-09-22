class AddDateToEntry < ActiveRecord::Migration[5.0]
  def change
    add_column :entries, :date, :datetime
  end
end
