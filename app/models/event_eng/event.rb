module EventEng
  class Event < ActiveRecord::Base
    
    default_scope order('start_date ASC')
    scope :this_month, lambda{|date| where("end_date >= ? and start_date < ?",  date.beginning_of_month,date.next_month.beginning_of_month)}
    
    attr_accessible :description, :end_date, :start_date, :title
    
    validates_presence_of :title, :description, :start_date, :end_date
    
    validate :ends_after_start
    
    def ends_after_start
      self.start_date ||= Time.now
      self.end_date ||= start_date.advance(:hours => 1)
      errors.add(:end_date, "end date must be after the start date") if self.end_date < self.start_date
    end
  end
end
