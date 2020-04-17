require 'spec_helper'
require_relative '../../api.rb'

describe DeliveryCenter do
    it 'sends a post request' do
        delivery = DeliveryCenter.new
        expect(delivery.code).to eq (200)
    end
end