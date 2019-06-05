defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / year_as_seconds(planet)
  end

  def year_as_seconds(:earth), do: 31557600
  def year_as_seconds(:mercury), do: year_as_seconds(:earth) * 0.2408467
  def year_as_seconds(:venus), do: year_as_seconds(:earth) * 0.61519726
  def year_as_seconds(:mars), do: year_as_seconds(:earth) * 1.8808158
  def year_as_seconds(:jupiter), do: year_as_seconds(:earth) * 11.862615
  def year_as_seconds(:saturn), do: year_as_seconds(:earth) * 29.447498
  def year_as_seconds(:uranus), do: year_as_seconds(:earth) * 84.016846
  def year_as_seconds(:neptune), do: year_as_seconds(:earth) * 164.79132
end
