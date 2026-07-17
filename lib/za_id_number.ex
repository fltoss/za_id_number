defmodule ZaIdNumber do
  @moduledoc """
  Validates South African ID numbers and extracts date of birth, age,
  gender, and citizenship status.

  South African ID numbers are 13 digits in the format `YYMMDDSSSSCAZ`.
  See `ZaIdNumber.Validator` for the full format description.
  """

  @doc """
  Validates an ID number and returns the parsed information.

  Accepts an optional `:today` reference date, used for the century
  pivot and age calculation (defaults to `Date.utc_today/0`).

  ## Examples

      iex> ZaIdNumber.validate("8001015009087", today: ~D[2024-06-15])
      {:ok,
       %{
         gender: :male,
         age: 44,
         date_of_birth: ~D[1980-01-01],
         citizen_status: :born_citizen
       }}

      iex> ZaIdNumber.validate("12345")
      {:error, "Invalid ID Number format"}

  """
  @spec validate(term(), keyword()) ::
          {:ok, ZaIdNumber.Validator.result()} | {:error, String.t()}
  defdelegate validate(id_number, opts \\ []), to: ZaIdNumber.Validator

  @doc """
  Returns `true` if the given value is a valid South African ID number.

  ## Examples

      iex> ZaIdNumber.valid?("8001015009087")
      true

      iex> ZaIdNumber.valid?("8001015009086")
      false

  """
  @spec valid?(term(), keyword()) :: boolean()
  def valid?(id_number, opts \\ []),
    do: match?({:ok, _}, validate(id_number, opts))
end
