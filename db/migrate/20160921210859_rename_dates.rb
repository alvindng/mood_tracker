class RenameDates < ActiveRecord::Migration[5.0]
  def change
    rename_table :dates, :entries
  end
end
