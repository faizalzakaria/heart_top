# frozen_string_literal: true

require 'spec_helper'

RSpec.describe HeartTop do
  it 'has a version number' do
    expect(HeartTop::VERSION).not_to be nil
  end

  it { expect(HeartTop::CLI.send('start')).to eq(true) }
  it { expect(HeartTop::CLI.send('stop')).to eq(true) }
end
