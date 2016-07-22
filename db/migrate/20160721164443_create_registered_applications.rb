class CreateRegisteredApplications < ActiveRecord::Migration
  def change
    create_table :registered_applications do |t|
      t.string :name
      t.string :url
      t.references :user

      t.timestamps null: false
    end
  end
end
