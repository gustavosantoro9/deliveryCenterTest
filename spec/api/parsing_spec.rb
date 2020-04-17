require 'spec_helper'
require_relative '../../parsing.rb'

describe ParseShipping do
    it 'parses a json file' do
        parse = ParseShipping.new
        expect(parse.fileExtension).to eq ('.json')
    end
end