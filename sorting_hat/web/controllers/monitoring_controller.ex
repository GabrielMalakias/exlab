defmodule SortingHat.MonitoringController do
  use SortingHat.Web, :controller

  def heart_beat(conn, _params) do
    render conn, "heart_beat.json"
  end
end
