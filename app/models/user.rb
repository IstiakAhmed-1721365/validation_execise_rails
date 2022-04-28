class User < ApplicationRecord
    has_many :plans

    after_save :create_first_post  #, if: User.posts.empty?
    validates :name, presence: true

    private
        def create_first_post
            start = Date.today.strftime("%d/%m/%y")
            end_da = 3.days.from_now.strftime("%d/%m/%y")
            #date = Date.strptime(start_date,'%d/%m/%y')
            #date2 = Date.strptime(end_date,'%d/%m/%y')
            self.plans.create(start_date: start, end_date: end_da, available: true)
        end
end
