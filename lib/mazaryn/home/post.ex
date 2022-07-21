defmodule Home.Post do
  use Ecto.Schema

  alias Home.{Follow, Like, Comment}
  alias Mazaryn.Repo

  import Ecto.Changeset
  import Ecto.Query, only: [from: 2]

  schema "posts" do
    field(:body, :string)
    field(:likes_count, :integer, default: 0)
    field(:gif_url, :string)
    field(:removed, :boolean, default: false)
    field(:pinned, :boolean, default: false)
    field(:profile_tags, {:array, :string}, default: [])
    has_many(:likes, Like)
    has_many(:comments, Comment)
    belongs_to(:user, Account.User)

    # timestamps()
  end

  @required_attrs [
    :body
  ]

  def changeset(post, params \\ %{}) do
    post
    |> cast(params, @required_attrs)
    |> validate_required(@required_attrs)
  end

  def add_post(%__MODULE__{} = post, params \\ %{}) do
    post
    |> changeset(params)
    |> Repo.insert()
  end

  def delete_post(%Post{} = post) do
    post
    |> Repo.delete()
  end

  def update_post(%__MODULE__{} = post, params \\ %{}) do
    post
    |> changeset(params)
    |> Repo.update()
  end

  def all_posts do
    Repo.all(__MODULE__)
  end

  def posts_from_user_following(user_id) do
    query =
      from(f in Follow,
        join: p in __MODULE__,
        as: :post,
        on: p.author == f.following,
        join: c in Comment,
        as: :comment,
        on: c.post_id == p.id,
        where: f.follower == ^user_id,
        order_by: [desc: p.date_created],
        select: [p, c]
      )

    Repo.all(query)
  end

  def posts_from_user(user_id) do
    query =
      from(p in __MODULE__,
        where: p.author == ^user_id,
        order_by: [desc: p.date_created],
        select: [p]
      )

    Repo.all(query)
  end

  def posts_from_user_following_with_comments(user_id) do
    query =
      from(f in Follow,
        join: p in __MODULE__,
        as: :post,
        on: p.author == f.following,
        join: c in Comment,
        as: :comment,
        on: c.post_id == p.id,
        where: f.follower == ^user_id,
        order_by: [desc: p.date_created],
        select: [p, c]
      )

    Repo.all(query)
  end

  def posts_from_user_with_comments(user_id) do
    query =
      from(p in __MODULE__,
        join: c in Comment,
        as: :comment,
        on: c.post_id == p.id,
        where: p.author == ^user_id,
        order_by: [desc: p.date_created],
        select: [p, c]
      )

    Repo.all(query)
  end

  def posts_from_user_following_with_comments_and_likes(user_id) do
    query =
      from(f in Follow,
        join: p in __MODULE__,
        as: :post,
        on: p.author == f.following,
        join: c in Comment,
        as: :comment,
        on: c.post_id == p.id,
        join: l in Like,
        as: :like,
        on: l.post_id == p.id,
        where: f.follower == ^user_id,
        order_by: [desc: p.date_created],
        select: [p, c, l]
      )

    Repo.all(query)
  end

  def posts_from_user_with_comments_and_likes(user_id) do
    query =
      from(p in __MODULE__,
        join: c in Comment,
        as: :comment,
        on: c.post_id == p.id,
        join: l in Like,
        as: :like,
        on: l.post_id == p.id,
        where: p.author == ^user_id,
        order_by: [desc: p.date_created],
        select: [p, c, l]
      )

    Repo.all(query)
  end
end
