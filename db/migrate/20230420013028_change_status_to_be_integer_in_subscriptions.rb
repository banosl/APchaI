class ChangeStatusToBeIntegerInSubscriptions < ActiveRecord::Migration[6.1]
  def change
    change_column :subscriptions, :status, :string
  end
end
