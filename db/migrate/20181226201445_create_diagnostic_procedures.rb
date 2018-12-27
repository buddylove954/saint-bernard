class CreateDiagnosticProcedures < ActiveRecord::Migration[5.1]
  def change
    create_table :diagnostic_procedures do |t|

      t.text :description
      t.datetime :moment
      t.integer :patient_id
    end
  end
end
