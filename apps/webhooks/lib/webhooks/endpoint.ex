defmodule Webhooks.Endpoint do
  use Plug.Router
  alias Webhooks.HandleEvent

  plug(Plug.Logger)
  plug(:match)
  plug(Plug.Parsers, parsers: [:json], json_decoder: Jason)
  plug(:dispatch)

  post "/handle_event" do
    HandleEvent.call(conn.body_params)
    conn = conn |> Plug.Conn.put_resp_header("content-type", "application/json")
    send_resp(conn, 200, Jason.encode!(%{}))
  end

  match _ do
    send_resp(conn, 404, "")
  end
end
