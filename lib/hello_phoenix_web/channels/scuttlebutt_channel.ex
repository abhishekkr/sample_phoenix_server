defmodule HelloPhoenixWeb.ScuttlebuttChannel do
  use HelloPhoenixWeb, :channel

  alias HelloPhoenix.Chats

  def join("scuttlebutt:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (scuttlebutt:lobby).
  def handle_in("shout", payload, socket) do
    Chats.create_message(payload) ## currently sync, can be made async
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
