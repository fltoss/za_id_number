defmodule ZaIdNumber.Validator do
  @moduledoc """
  Parses and validates South African ID numbers.

  The format is `YYMMDDSSSSCAZ`:

  - `YYMMDD` - date of birth
  - `SSSS`   - gender sequence (0000-4999 female, 5000-9999 male)
  - `C`      - citizenship (0 = born citizen, 1 = permanent resident)
  - `A`      - historical field, unused
  - `Z`      - Luhn checksum digit
  """

  alias ZaIdNumber.Luhn

  @type result :: %{
          gender: :female | :male,
          age: non_neg_integer(),
          date_of_birth: Date.t(),
          citizen_status: :born_citizen | :permanent_resident
        }

  @doc """
  Validates and returns id number information.

  ## Options

  - `:today` - reference date used for the century pivot and age
    calculation. Defaults to `Date.utc_today/0`.
  """
  @spec validate(id_number :: term(), opts :: keyword()) ::
          {:ok, result()} | {:error, String.t()}
  def validate(value, opts \\ [])

  def validate(
        <<yy::binary-size(2), mm::binary-size(2), dd::binary-size(2),
          seq::binary-size(4), c::binary-size(1), _a::binary-size(1),
          _z::binary-size(1)>> = value,
        opts
      ) do
    today = Keyword.get(opts, :today) || Date.utc_today()

    with true <- digits?(value),
         {:ok, date} <- calculate_date(today, yy, mm, dd),
         {:ok, citizen} <- calculate_citizen(String.to_integer(c)),
         :ok <- calculate_luhn(value) do
      {:ok,
       %{
         age: calculate_age(today, date),
         date_of_birth: date,
         gender: calculate_gender(String.to_integer(seq)),
         citizen_status: citizen
       }}
    else
      false -> {:error, "Invalid ID Number format"}
      {:error, error} -> {:error, error}
    end
  end

  def validate(_value, _opts), do: {:error, "Invalid ID Number format"}

  defp digits?(<<>>), do: true
  defp digits?(<<char, rest::binary>>) when char in ?0..?9, do: digits?(rest)
  defp digits?(_value), do: false

  defp calculate_luhn(value) do
    if Luhn.valid?(value) do
      :ok
    else
      {:error, "Invalid ID Number checksum"}
    end
  end

  defp calculate_citizen(0), do: {:ok, :born_citizen}
  defp calculate_citizen(1), do: {:ok, :permanent_resident}
  defp calculate_citizen(_), do: {:error, "Invalid ID Number C code"}

  defp calculate_gender(code) when code > 4999, do: :male
  defp calculate_gender(_code), do: :female

  defp calculate_date(today, yy, mm, dd) do
    year = String.to_integer(yy)
    year = if year + 2000 >= today.year, do: year + 1900, else: year + 2000

    case Date.new(year, String.to_integer(mm), String.to_integer(dd)) do
      {:ok, date} -> {:ok, date}
      _ -> {:error, "Invalid ID Number date"}
    end
  end

  defp calculate_age(today, date) do
    age = today.year - date.year

    if {today.month, today.day} < {date.month, date.day},
      do: age - 1,
      else: age
  end
end
