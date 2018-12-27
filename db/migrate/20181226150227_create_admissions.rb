class CreateAdmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :admissions do |t|
      t.datetime :moment
    end
  end
end
