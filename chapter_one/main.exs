IO.puts("Hello world from Elixir!")

num = div 10, 2

# This is a comment
IO.puts(num)

IO.puts(0b1010)

IO.puts(1.0e-10)

if :apple == :apple do
  IO.puts("#{:apple} = #{:apple}")
end

add = fn a, b -> a + b end

IO.puts(add.(1, 2))

IO.puts(is_function(add, 2))
IO.puts(is_function(add, 1))

double = fn a -> add.(a, a) end

IO.puts(double.(2))

list = [1, 2 , true, 3, false]

IO.puts(length(list))

IO.puts(list -- [true, false])
