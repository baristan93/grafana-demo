# frozen_string_literal: true

require 'lograge'
Rails.application.configure do
  # Logging -- single line logs, json format
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.logger = ActiveSupport::Logger.new($stdout)
end
