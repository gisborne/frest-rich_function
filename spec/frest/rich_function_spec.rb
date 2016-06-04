require 'spec_helper'

describe Frest::RichFunction do
  it 'has a version number' do
    expect(Frest::RichFunction::VERSION).not_to be nil
  end

  it 'can call a rich function' do
    f = Frest::RichFunction.enrich(fn: ->(a:){a})
    expect(f.call(a: 1)).to eq(1)
  end

  it 'can curry a rich function' do
    f = Frest::RichFunction.enrich(fn: ->(a:, b:){[a, b]})
    g = f.call(a: 'A')
    expect(g.call(b: 'B')).to eq(['A', 'B'])
  end
end
