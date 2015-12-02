require 'objspace'
def heap_dump
  GC.start
  i = Time.now.strftime('%s')
  open("ruby-heap-#{i}.dump", "w") do |io|
    ObjectSpace.dump_all(output: io)
  end
end

ObjectSpace.trace_object_allocations_start
5.times do |x|
  puts x
  heap_dump
end
