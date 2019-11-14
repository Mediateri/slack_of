class User < ApplicationRecord
    require 'clockwork'
    include Clockwork
    after_create :notify_slack
    
    def notify_slack
        module Clockwork
             handler do |name|
                SlackNotifier::CLIENT.ping "🎉 New user: #{name} 🎉"
            end
      
        # handler receives the time when job is prepared to run in the 2nd argument
        # handler do |job, time|
        #   puts "Running #{job}, at #{time}"
        # end
      
            every(10.seconds, 'frequent.name')
            every(3.minutes, 'less.frequent.name')
            every(1.hour, 'hourly.job')
        end
  end
end
