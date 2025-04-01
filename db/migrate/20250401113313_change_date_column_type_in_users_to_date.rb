class ChangeDateColumnTypeInUsersToDate < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :date, :date
  end
end
