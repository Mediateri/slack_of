require 'slack-notifier'
require 'clockwork'
require 'active_support/time'
module Clockwork
  handler do |send|
    notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
    notifier.ping('Hello')
  end
  every(3.seconds, 'send')
end