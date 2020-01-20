defmodule PhxI18nExampleWeb.UserIdPlug do
  alias Plug.Conn
  @behaviour Plug

  @num_bytes 16

  @impl Plug
  def init(_opts), do: nil

  @impl Plug
  def call(conn, _opts) do
    random_id =
      @num_bytes
      |> :crypto.strong_rand_bytes()
      |> Base.encode64()

    conn
    |> Conn.assign(:user_id, random_id)
    |> Conn.put_session(:user_id, random_id)
  end
end
