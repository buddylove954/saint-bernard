class Admission < ApplicationRecord
  has_many :patients
  has_many :diagnoses
  has_many :symptoms
  has_many :observations

  def date
  	self.moment.to_date
  end

  def time
  	self.moment.strftime("%H:%M")
  end

  def list_of_diagnoses_descriptions(patient_id)
  	self.diagnoses.where(patient_id: patient_id).map { |diagnosis| diagnosis.description}
  end

end
