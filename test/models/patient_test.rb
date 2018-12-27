require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  def setup
    @patient = Patient.create(first_name: "Mr", middle_name: "Doctor", last_name: "Strange", dob: DateTime.now, gender: "male")
    @allergies = [Allergy.create(description: "Peanuts"), Allergy.create(description: "Shell Fish"), Allergy.create(description: "Ice Cream"), Allergy.create(description: "Water")]
    @admission = Admission.create(moment: DateTime.new(2012, 07, 11, 20, 10, 0))
    @diagnoses = Diagnosis.create(coding_system: "test_system", code: "test code", description: "sick", patient_id: @patient.id)
    @chronic_conditions = Diagnosis.create(coding_system: "chronic", code: "chronic", description: "very bad", patient_id: @patient.id)
    @symptom = Symptom.create(description: "Upset Tummy")
    @treatment = Treatment.create(description: "Drink more water", necessity: "very", patient_id: @patient.id)
    @diagnostic_procedure = DiagnosticProcedure.create(description: "WOW", moment: DateTime.now, patient_id: @patient.id)
    @observation = Observation.create(description: "Patient has explosive diarrhea", moment: DateTime.now)
    @medication_order = MedicationOrder.create(name: "Advil", unit: "mg", dosage: 10.00, route: "IM", necessity: "very")
    @order_frequency = OrderFrequency.create(value: "1", unit: "hour")
    @medication_order.order_frequency = @order_frequency
    @admission.diagnosis << @diagnoses
    @admission.symptoms << @symptom
    @admission.observations << @observation
  end

  test "patients should have a list of allergies" do
    @patient.allergies << @allergies
    @patient.save
    assert_equal @patient.allergies, @allergies
  end

  test "patients should have a list of medications" do
    @patient.medications << @medication_order
    @patient.save
    assert_equal @patient.medications, [@medication_order]
  end

  test "patients should be able to have an admission" do
    @patient.admission_id = @admission.id
    @patient.save
    assert_equal @patient.admission, @admission
  end

  test "chronic conditions should only return conditions with this code" do
    assert_equal @patient.chronic_conditions, [@chronic_conditions]
  end

  test "diagnosis should return all diagnosises" do
    assert_equal @patient.diagnoses, [@diagnoses, @chronic_conditions]
  end

  test "patients should have a list treatments" do
    assert_equal @patient.treatments, [@treatment]
  end

  test "patients should have a list diagnostic_procedures" do
    assert_equal @patient.diagnostic_procedures, [@diagnostic_procedure]
  end
end
