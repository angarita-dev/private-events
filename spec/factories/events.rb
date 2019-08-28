# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :event do |f|
    f.title { "I'm a title" }
    f.description { "I'm a description" }
    f.creator_id { 1 }
    f.event_date { Date.current }
  end
end
