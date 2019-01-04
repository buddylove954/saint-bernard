class DiagnosticProcedure < ApplicationRecord
  belongs_to :patient

  def date
    self.moment.to_date
  end

  def time
    self.moment.strftime("%H:%M")
  end
end
