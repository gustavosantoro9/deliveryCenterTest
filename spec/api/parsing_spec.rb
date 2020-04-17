require 'spec_helper'
require_relative '../../parsing.rb'

describe ParseShipping do
    it 'parses a json file' do
        result = subject.fileExtension
        expect(result).to eq ('.json')
    end
end