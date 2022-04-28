class User < ApplicationRecord
    has_many :plans

    after_save :create_first_post  #, if: User.posts.empty?
    validates :name, presence: true

    private
        def create_first_post
            start_date = Date.today
            end_date = 3.days.from_now
            date = Date.strptime(start_date,'%d/%m/%y')
            date2 = Date.strptime(end_date,'%d/%m/%y')
            self.plans.create(start_date: date, end_date: date2, available: true)
        end
end
