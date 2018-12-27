class Admission < ApplicationRecord
  has_many :patients
  has_many :diagnosis
  has_many :symptoms
  has_many :observations
end
