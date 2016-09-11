defmodule Ffaker.En.Name do
  import Ffaker
  alias Ffaker.En.Gender
  @moduledoc """
  Functions for name data in English
  """
  @suffixes ~w(Jr. Sr. I II III IV V MD DDS PhD DVM)
  @female_prefixes ~w(Mrs. Miss.)
  @other_prefixes ~w(Ms. Dr.)

  @doc """
  Returns name

  ## Examples

      iex> Ffaker.En.Name.name
      "Joe Bogan"
  """
  @spec name() :: String.t
  def name do
    "#{first_name} #{last_name}"
  end

  @doc """
  Returns html safe name

  ## Examples

      iex> Ffaker.En.Name.html_safe_name
      "Joe Bogan"
  """
  @spec html_safe_name() :: String.t
  def html_safe_name do
    "#{first_name} #{html_safe_last_name}"
  end

  @doc """
  Returns first name

  ## Examples

      iex> Ffaker.En.Name.first_name
      "Joe"
  """
  @spec first_name() :: String.t
  def first_name do
    Gender.female? && female_first_name || male_first_name
  end

  @doc """
  Returns male first name

  ## Examples

      iex> Ffaker.En.Name.male_first_name
      "Joe"
  """
  @spec male_first_name() :: String.t
  def male_first_name do
    "data/en/name/first_names_male"
    |> list_file
    |> random
  end

  @doc """
  Returns female first name

  ## Examples

      iex> Ffaker.En.Name.female_first_name
      "Alice"
  """
  @spec female_first_name() :: String.t
  def female_first_name do
    "data/en/name/first_names_female"
    |> list_file
    |> random
  end

  @doc """
  Returns last name

  ## Examples

      iex> Ffaker.En.Name.last_name
      "Bogan"
  """
  @spec last_name() :: String.t
  def last_name do
    "data/en/name/last_names"
    |> list_file
    |> random
  end

  @doc """
  Returns html safe last name

  ## Examples

      iex> Ffaker.En.Name.html_safe_last_name
      "Bogan"
  """
  @spec html_safe_last_name() :: String.t
  def html_safe_last_name do
    "data/en/name/last_names"
    |> list_file
    |> Enum.filter(&(not String.contains?(&1, "'")))
    |> random
  end

  @doc """
  Returns prefix

  ## Examples

      iex> Ffaker.En.Name.prefix
      "Miss."
  """
  @spec prefix() :: String.t
  def prefix do
    case Gender.gender do
       "female" -> female_prefix
       "male" -> male_prefix
       _ -> other_prefix
    end
  end

  @doc """
  Returns male prefix

  ## Examples

      iex> Ffaker.En.Name.male_prefix
      "Mr."
  """
  @spec male_prefix() :: String.t
  def male_prefix do
    "Mr."
  end

  @doc """
  Returns female prefix

  ## Examples

      iex> Ffaker.En.Name.female_prefix
      "Miss."
  """
  @spec female_prefix() :: String.t
  def female_prefix do
    @female_prefixes
    |> random
  end

  @doc """
  Returns gender neutral prefix

  ## Examples

      iex> Ffaker.En.Name.other_prefix
      "Dr."
  """
  @spec other_prefix() :: String.t
  def other_prefix do
    @other_prefixes
    |> random
  end

  @doc """
  Returns suffix

  ## Examples

      iex> Ffaker.En.Name.suffix
      "Jr."
  """
  @spec suffix() :: String.t
  def suffix do
    @suffixes
    |> random
  end
end
