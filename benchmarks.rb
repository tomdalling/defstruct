require 'benchmark'
require 'defstruct'

ITERATIONS = 500000
RJUST = 40
NormalVector = Struct.new(:x, :y)
DefStructVector = DefStruct.new{{x: 0.0, y: 0.0}}
normal_vec = NormalVector.new(0.0, 0.0)
defstruct_vec = DefStructVector.new

printf ' '*RJUST
Benchmark.bm do |b|
  b.report('Empty iteration'.rjust(RJUST, ' ')) do
    ITERATIONS.times { }
  end

  b.report('NormalVector instantiation'.rjust(RJUST, ' ')) do
    ITERATIONS.times { inst = NormalVector.new(0.0, 0.0) }
  end

  b.report('DefStructVector default instantiation'.rjust(RJUST, ' ')) do
    ITERATIONS.times { inst = DefStructVector.new }
  end

  b.report('DefStructVector explicit instantiation'.rjust(RJUST, ' ')) do
    ITERATIONS.times { inst = DefStructVector.new(x: 0.0, y: 0.0) }
  end

  b.report('NormalVector attr access/mutate'.rjust(RJUST, ' ')) do
    ITERATIONS.times { normal_vec.x = normal_vec.x + 1.0 }
  end

  b.report('DefStructVector attr access/mutate'.rjust(RJUST, ' ')) do
    ITERATIONS.times { defstruct_vec.x = defstruct_vec.x + 1.0 }
  end
end

