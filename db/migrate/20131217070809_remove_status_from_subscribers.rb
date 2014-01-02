class RemoveStatusFromSubscribers < ActiveRecord::Migration
  def change
    remove_column :subscribers, :status, :boolean
  end
end
