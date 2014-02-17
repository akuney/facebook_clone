class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false

      t.string :birth_month
      t.string :birth_day
      t.string :birth_year

      t.string :gender

      t.string :job
      t.string :employer

      t.string :current_city
      t.string :home_city

      t.string :relationship_status
      t.string :interested_in

      t.text :about_me

      t.timestamps
    end
  end
end
