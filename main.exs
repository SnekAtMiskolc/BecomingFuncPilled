defmodule Say do
  def hello_world(name) do
    IO.puts "Hello " <> name <> "!"
  end
end

Say.hello_world("John")

defmodule User do
  defstruct name: "", age: 0

  @spec create(String.t, String.t) :: %User{}
  def create(name, age) do
    IO.puts "Created new user with name: " <> name
    %User{name: name, age: age}
  end

  def put(user = %User{}) do
    IO.puts "Username: " <> user.name
    IO.puts "User age: #{user.age}"
  end

end

user = User.create("John Doe", 24)
user |> User.put
