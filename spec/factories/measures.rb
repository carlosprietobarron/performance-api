# frozen_string_literal: true

FactoryBot.define do
  factory :measure do
    day { '2021-01-01' }
    measure { 20 }
    comentary { 'notes' }

    association :indicator
  end
end
