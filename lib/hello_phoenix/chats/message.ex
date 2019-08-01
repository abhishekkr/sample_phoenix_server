defmodule HelloPhoenix.Chats.Message do
  use Ecto.Schema
  import Ecto.Changeset

  schema "messages" do
    field :from, :string
    field :msg, :string

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:from, :msg])
    |> validate_required([:from, :msg])
  end
end
