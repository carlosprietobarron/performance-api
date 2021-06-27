# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'get /indicator_routes' do
  it 'routes to /indicators/id/measures' do
    expect(post('/indicators/1/measures')).to route_to(controller: 'measures', action: 'create', indicator_id: '1')
  end
end
