defmodule PensieveWeb.MemoryInformation do
  use Phoenix.Component

  attr :memories, :list, default: []

  def information(assigns) do
    ~H"""
    <div class="italic mb-4">
      There are <%= length(@memories) %> memories in our pensieve
    </div>
    """
  end
end
