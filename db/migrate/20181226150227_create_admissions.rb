class CreateAdmissions < ActiveRecord::Migration
  def change
    create_table :admissions do |t|
      t.datetime :moment
    end
  end
end
