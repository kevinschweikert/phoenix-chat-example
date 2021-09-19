defmodule ImenChatWeb.ChatLive do
  use ImenChatWeb, :live_view

  def mount(_, _, socket) do
    if connected?(socket) do
      ImenChatWeb.Endpoint.subscribe("chat")
    end

    {:ok, assign(socket, messages: [], username: "", msg: "")}
  end

  def handle_event("send", %{"msg" => %{"body" => body, "name" => name}}, socket) do
    ImenChatWeb.Endpoint.broadcast!("chat", "new_message", %{:body => body, :name => name})
    socket = assign(socket, username: name, msg: "")
    {:noreply, socket}
  end

  def handle_info(%{event: "new_message", payload: message}, socket) do
    socket =
      socket
      |> update(:messages, fn msgs -> msgs ++ [message] end)

    {:noreply, socket}
  end
end
