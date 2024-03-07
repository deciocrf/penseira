defmodule Pensieve.Memories do
  alias Pensieve.Repo
  alias Pensieve.Memories.Memory

  @spec list_memories() :: [Memory]
  def list_memories, do: Repo.all(Memory)

  @type id :: pos_integer | binary
  @spec fetch_memory(id) :: {:ok, %Memory{}} | {:error, atom}
  def fetch_memory(id) do
    case Repo.get(Memory, id) do
      %Memory{} = memory -> { :ok, memory }
      nil -> { :error, :not_found }
    end
  end

  def change_memory(%Memory{} = memory, attrs \\ %{}) do
    Memory.changeset(memory, attrs)
  end

  def create_memory(attrs \\ %{}) do
    %Memory{}
    |> Memory.changeset(attrs)
    |> Repo.insert()
  end

  def update_memory!(%Memory{} = memory, attrs) do
    memory
    |> Memory.changeset(attrs)
    |> Repo.update()
  end

  def delete_memory!(%Memory{} = memory), do: Repo.delete(memory)
end
