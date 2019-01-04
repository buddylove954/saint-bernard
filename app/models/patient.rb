class Patient < ApplicationRecord
  enum gender: [:male, :female, :other]
  has_many :allergies
  has_many :chronic_conditions, -> {where code: "chronic"}, class_name: 'Diagnosis'
  has_many :medications, class_name: 'MedicationOrder'
  has_many :diagnoses, class_name: 'Diagnosis'
  has_many :treatments
  has_many :diagnostic_procedures
  belongs_to :admission, optional: true

  def summary(facility_name)
  	"This #{self.age} years old #{self.gender} was admitted to #{facility_name} on #{self.admission.date} at #{self.admission.time}
  	 due to #{self.admission.list_of_diagnoses_descriptions(self.id).to_sentence}. The observed symptoms on admission were 
  	 #{self.admission.symptoms.to_sentence}. 

  	 Upon asking about known allergies, the patient disclosed #{self.list_of_allergies}. Upon asking about the chronic conditions,
  	 the patient disclosed #{self.chronic_conditions.collect(&:description).to_sentence}. The patient was administered with #{self.list_of_medications}.

     The staff performed #{self.diagnostic_procedures_sentence} revealing #{(self.diagnoses.collect(&:description)).to_sentence}.
     Our team proceeded to #{self.treatments_sentence}."
  end

  def age
  	 now = Time.now.utc.to_date
  	 now.year - self.dob.year - ((now.month > self.dob.month || (now.month == self.dob.month && now.day >= self.dob.day)) ? 0 : 1)
  end

  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def treatments_sentence
    self.treatments.collect { |treatment| "#{treatment.description} to #{treatment.necessity}"}.to_sentence
  end

  def list_of_allergies
  	self.allergies.collect(&:description).to_sentence if self.allergies
  end

  def list_of_medications
  	self.medications.collect { |medication| "#{medication.name} #{medication.dosage.to_f} #{medication.order_frequency.value}#{medication.order_frequency.unit} to #{medication.necessity}"}.to_sentence
  end

  def diagnostic_procedures_sentence
    self.diagnostic_procedures.collect { |procedure| "#{procedure.description} on #{procedure.date} at #{procedure.time}"}.to_sentence
  end

end
