class AddAttributesToTickets < ActiveRecord::Migration
  def change
    add_column :tickets, :complete, :boolean
    add_column :tickets, :end_time, :datetime
  end
end
