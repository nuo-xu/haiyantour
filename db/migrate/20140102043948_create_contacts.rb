class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :telephone
      t.string :company
      t.string :kind
      t.text :content
      t.string :heard_about_us
    end
  end
end
