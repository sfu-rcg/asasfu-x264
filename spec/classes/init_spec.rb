require 'spec_helper'
describe 'x264' do

  context 'with defaults for all parameters' do
    it { should contain_class('x264') }
  end
end
