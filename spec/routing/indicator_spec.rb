# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'get /indicator_routes' do
  it 'routes to /indicators' do
    expect(get('/indicators')).to route_to(controller: 'indicators', action: 'index')
  end

  it 'routes to post /indicators' do
    expect(post('/indicators')).to route_to(controller: 'indicators', action: 'create')
  end

  it 'routes to get /indicators/1' do
    expect(get: '/indicators/1').to route_to(
      controller: 'indicators',
      action: 'show',
      id: '1'
    )
  end
end
