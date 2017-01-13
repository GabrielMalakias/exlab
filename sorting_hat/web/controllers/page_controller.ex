defmodule SortingHat.PageController do
  use SortingHat.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
