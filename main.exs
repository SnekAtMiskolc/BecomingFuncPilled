defmodule Say do
  def hello_world(name) do
    IO.puts("Hello " <> name <> "!")
  end
end

Say.hello_world("John")

defmodule User do
  defstruct name: "", age: 0

  @spec create(String.t(), String.t()) :: %User{}
  def create(name, age) do
    IO.puts("Created new user with name: " <> name)
    %User{name: name, age: age}
  end

  @spec create(String.t(), String.t(), String.t(), String.t()) :: [%User{}]
  def create(name, age, name2, age2) do
    IO.puts("Created new user with name: " <> name)
    [%User{name: name, age: age}, %User{name: name2, age: age2}]
  end

  def put(user = %User{}) do
    IO.puts("Username: " <> user.name)
    IO.puts("User age: #{user.age}")
  end

  @spec put(list(%User{})) :: :ok
  def put(users) do
    Enum.each(users, fn u -> User.put(u) end)
    :ok
  end
end

users = User.create("John Doe", 24, "Peter Griffin", 45)
user = [User.create("John Doe", 24)]
users = users ++ user
users |> User.put()

# These two lambda function declarations are the same.
# & <- Capture operator
# lambda = fn x, y, z -> z * y + x end
lambda = &(&1 + &2 + 2)

lambda.(1, 2) |> IO.puts()
