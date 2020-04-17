require 'spec_helper'
require_relative '../../api.rb'

describe DeliveryCenter do
    it 'sends a post request' do
        result = subject.code
        expect(result).to eq (200)
    end
end