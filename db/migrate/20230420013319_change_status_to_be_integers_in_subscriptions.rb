class ChangeStatusToBeIntegersInSubscriptions < ActiveRecord::Migration[6.1]
  def change
    change_column :subscriptions, :status, :integer, using: 'status::integer', default: 0
  end
end
