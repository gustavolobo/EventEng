module EventEng
  module EventsHelper
    
    def weekend?(week_day)
      if week_day == 6 or week_day == 7
        return "weekend"
      else
        return ""
      end
    end
    
    def calendar(year, month)
      month = Date.new(year.to_i, month.to_i)
      days_behind = (month.wday-1)%7

      if days_behind > 0
        number_of_days_of_last_month = month.prev_month.at_end_of_month.day
      end

      number_of_days = month.at_end_of_month.day

      days = 1
      month_array = {}
      month_array[0] = []
      for i in 0...7
        if days_behind > 0
          month_array[0][i] = number_of_days_of_last_month - days_behind + 1
          days_behind = days_behind - 1
        else
          month_array[0][i] = days
          days = days + 1
          number_of_days = number_of_days - 1
        end
      end

      number_of_middle_weeks = number_of_days / 7

      for i in 0...number_of_middle_weeks
        month_array[i+1] = []
        for j in 0...7
          month_array[i+1][j] = days
          days = days + 1
          number_of_days = number_of_days - 1
        end
      end

      days_left = number_of_days % 7

      if days_left > 0
        last_week = month_array.length
        month_array[last_week] = []

        for i in 0...days_left
          month_array[last_week][i] = days
          days = days + 1
          number_of_days = number_of_days - 1
        end
        days = 1
        for i in days_left...7
          month_array[last_week][i] = days
          days = days + 1
        end
      end

      month_array
    end
    
    def events_per_month(year, month)
      days_of_month = Date.new(year, month).at_end_of_month.day

      events = Event.this_month(Date.new(year, month))

      events_array = {}

      date = Date.new(year, month, 1);

      for i in 1...days_of_month+1
        events_array[i] = []
        events_this_day = events.select { |e| e if e.end_date >= date and e.start_date <= date }
        unless events.empty?
          events_array[i] = events_this_day unless events_this_day.nil?
        end
        date = date.next_day
      end

      events_array
    end
    
  end
end
