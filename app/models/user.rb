class User < ApplicationRecord

    after_create :notify_slack
    
    def notify_slack
        SlackNotifier::CLIENT.ping "🎉 New user: #{name} 🎉"      
    end
end
