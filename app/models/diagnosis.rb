class Diagnosis < ApplicationRecord
  belongs_to :patient
  belongs_to :admission, optional: true
end
