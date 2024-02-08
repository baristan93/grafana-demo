# frozen_string_literal: true

require 'lograge'
require 'prometheus_exporter/middleware'
require 'opentelemetry/sdk'
require 'opentelemetry/exporter/otlp'
require 'opentelemetry/instrumentation/all'

Rails.application.configure do
  # Logging -- single line logs, json format
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  config.lograge.logger = ActiveSupport::Logger.new($stdout)

  # Metrics -- Prometheus
  config.middleware.use PrometheusExporter::Middleware

  # Tracing -- OpenTelemetry
  OpenTelemetry::SDK.configure(&:use_all)
end
