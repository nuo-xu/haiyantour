class CreateSubscriber < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :email_address
      t.boolean :status
    end
  end
end
