require 'test_helper'

class AdmissionTest < ActiveSupport::TestCase
  def setup
    @admission = Admission.create(moment: DateTime.new(2012, 07, 11, 20, 10, 0))
    @patient = Patient.create(first_name: "Mr", middle_name: "Doctor", last_name: "Strange", dob: DateTime.now, gender: "male")
    @diagnoses = Diagnosis.create(coding_system: "test_system", code: "test code", description: "sick", patient_id: @patient.id)
    @symptom = Symptom.create(description: "Upset Tummy")
    @observation = Observation.create(description: "Patient has explosive diarrhea", moment: DateTime.now)
  end

  test "admission should be able to have a list of patients" do
    @admission.patients << @patient
    assert_equal @patient, @admission.patients.first
  end

  test "admission should be able to have a list of diagnosis" do
    @admission.diagnosis << @diagnoses
    assert_equal @diagnoses, @admission.diagnosis.first
  end

  test "admission should be able to have a list of symptoms" do
    @admission.symptoms << @symptom
    assert_equal @symptom, @admission.symptoms.first
  end

  test "admission should be able to have a list of observations" do
    @admission.observations << @observation
    assert_equal @observation, @admission.observations.first
  end
end
