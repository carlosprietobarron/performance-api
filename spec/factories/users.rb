# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'carlos' }
    email { 'carlos@gmail.com' }
    password { 'password' }
  end
end
