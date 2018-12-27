class Patient < ApplicationRecord
  enum gender: [:male, :female, :other]
  has_many :allergies
  has_many :chronic_conditions, -> {where code: "chronic"}, class_name: Diagnosis
  has_many :medications, class_name: 'MedicationOrder'
  has_many :diagnoses, class_name: Diagnosis
  has_many :treatments
  has_many :diagnostic_procedures
  belongs_to :admission
end
