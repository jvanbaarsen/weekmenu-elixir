defmodule Weekmenu.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Comeonin.Bcrypt

  schema "users" do
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :name, :string

    timestamps()
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end

  def signup_changeset(user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:password])
    |> validate_required([:password])
    |> encrypt_password
    |> unique_constraint(:email)
  end

  defp encrypt_password(changeset) do
    password =
      changeset
      |> get_field(:password)
      |> Bcrypt.hashpwsalt()

    put_change(changeset, :encrypted_password, password)
  end
end
