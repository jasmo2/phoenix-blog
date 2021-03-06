defmodule BlogPhoenix.Post do
  use BlogPhoenix.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "posts" do
    field :title, :string
    field :body, :string
    embeds_many :items, BlogPhoenix.Comment

    timestamps
  end

  @required_fields ~w(title body)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
