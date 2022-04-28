class Plan < ApplicationRecord

    belongs_to :user
    
    #validates :name, length: {in:6..10}


validate :start_date_cannot_be_in_the_past, :end_date_cannot_be_in_the_past
=begin
private
    def custome_method
        return if name.size > 10
        errors.add(:name, "must be >10")
    end

=end
private
    def start_date_cannot_be_in_the_past 
        #Plan.connection
        date = Date.strptime(start_date,'%d/%m/%y')
        if date.present? && date < Date.today
          errors.add(:start_date, "can't be in the past")
        end
    end

    def end_date_cannot_be_in_the_past 
        #Plan.connection
        date = Date.strptime(end_date,'%d/%m/%y')
        date_start = Date.strptime(start_date,'%d/%m/%y')
        if date > date_start
            if date.present? && date < Date.today
                errors.add(:end_date, "can't be in the past")
            end
        else
            errors.add(:end_date, "can't be before start date")
        end
    end
end
