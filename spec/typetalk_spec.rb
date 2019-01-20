require 'spec_helper'

describe Danger::Typetalk do
  it 'should be a plugin' do
    expect(Danger::Typetalk.new(nil)).to be_a Danger::Plugin
  end
end

describe Danger::Typetalk do
  describe 'withDangerfile' do
    before do
      @dangerfile = testing_dangerfile
      @my_plugin = @dangerfile.typetalk
    end
  end
end