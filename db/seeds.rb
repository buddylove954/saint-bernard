# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
patient_data = {first_names: ["Tony", "Will", "Joe", "Mike", "Jake", "MasterYi", "Bruce"],
                middle_names: ["S", "B", "A", "Y", "Foo", "Bar"],
                last_names: ["Strange", "Stark", "Kong", "Young", "Love", "Wayne"],
                gender: ["male", "female", "other"]
}
allergies = [Allergy.create(description: "Peanuts"), Allergy.create(description: "Shell Fish"), Allergy.create(description: "Ice Cream"), Allergy.create(description: "Water")]
admission = Admission.create(moment: DateTime.new(2012, 07, 11, 20, 10, 0))
symptom = Symptom.create(description: "Upset Tummy")
admission.symptoms << symptom
Facility.create(name: "Broward General")
medication_order = MedicationOrder.create(name: "Advil", unit: "mg", dosage: 10.00, route: "IM", necessity: "relieve pain")
order_frequency = OrderFrequency.create(value: "1", unit: "hour")
medication_order.order_frequency = order_frequency

patient = Patient.create(first_name: patient_data[:first_names].sample, middle_name: patient_data[:middle_names].sample, last_name: patient_data[:last_names].sample, dob: (DateTime.new(1989, 02, 17, 20, 10, 0)), gender: patient_data[:gender].sample, admission_id: admission.id, mr: "Healthy")
patient.allergies << allergies
Diagnosis.create(coding_system: "test_system", code: "test code", description: "coughing", patient_id: patient.id, admission_id: admission.id)
Diagnosis.create(coding_system: "test_chronic_system", code: "chronic", description: "sneezing", patient_id: patient.id, admission_id: admission.id)
DiagnosticProcedure.create(description: "exploratory radiography", moment: DateTime.now, patient_id: patient.id)
Treatment.create(description: "brace the right leg", necessity: "to restrict motion", patient_id: patient.id)
patient.medications << medication_order
