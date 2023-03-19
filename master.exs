defmodule DoStuff do

    def stuff(x) do
        cond do
            x == 0 -> {:equal, x}
            x > 0 -> {:larger, x}
            x < 0 -> {:smaller, x}
        end
    end

    def compare({result, contents}) do
        case result do
            :larger -> IO.puts("#{contents} is larger than 0!")
            :equal -> IO.puts("#{contents} is equal to 0!")
            _ -> IO.puts("#{contents} is smaller than 0!")
        end
    end

end

defmodule MyApp do

    import DoStuff

    case {1, 2 ,3} do
        {4,5,6} -> IO.puts "Won't match!"
        {1,x,x} when x < 0 -> IO.puts "Won't match!"
        {1,x,3} -> IO.puts "x is: #{x}"
    end

    stuff(2) |> compare
    stuff(0) |> compare
    stuff(-2) |> compare

end
