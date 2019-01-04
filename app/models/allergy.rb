class Allergy < ApplicationRecord
  belongs_to :patient, optional: true
end
