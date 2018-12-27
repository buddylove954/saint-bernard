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

10.times do |num|
  patient = Patient.create(first_name: patient_data["first_names"].sample, middle_name: patient_data["middle_names"].sample, last_name: patient_data["last_names"].sample, dob: DateTime.now, gender: patient_data["gender"].sample)
  patient.allergies << allergies.sample(rand(1..4))
  Diagnosis.create(coding_system: "test_system", code: "test code", description: "sick", patient_id: patient.id)
  DiagnosticProcedure.create(description: "WOW", moment: DateTime.now, patient_id: patient.id)

end
