class RemoveStatusFromSubscribers < ActiveRecord::Migration
  # def change
  #   remove_column :subscribers, :status, :boolean
  # end
  def down
    remove_column :subscribers, :status
  end

  def up
    add_column :subscribers, :status, :boolean
  end
end
