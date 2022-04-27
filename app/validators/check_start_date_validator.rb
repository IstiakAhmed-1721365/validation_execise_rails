class CheckStartDateValidator < ActiveModel::Validator
  def start_date_cannot_be_in_the_past (record)
    #Plan.connection
    date = Date.strptime(record.start_date,'%d/%m/%y')
    if date.present? && date < Date.today
      errors.add(:start_date, "can't be in the past")
    end
  end
end