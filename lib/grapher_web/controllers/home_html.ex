defmodule GrapherWeb.HomeHTML do
  @moduledoc """
  This module contains pages rendered by PageController.

  See the `page_html` directory for all templates available.
  """
  use GrapherWeb, :html

  embed_templates "home_html/*"
end
