defmodule HelloPhoenixWeb.PageController do
  use HelloPhoenixWeb, :controller

  alias HelloPhoenix.Chats

  def index(conn, _params) do
    messages = Chats.list_messages()
    render conn, "index.html", messages: messages
  end
end
