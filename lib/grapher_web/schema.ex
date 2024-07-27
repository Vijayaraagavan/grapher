defmodule GrapherWeb.Schema do
  use Absinthe.Schema
  alias GrapherWeb.Resolvers.Posts
  alias GrapherWeb.Resolvers.Users

  object :end_user do
    field :id, non_null(:id)
    field :external_id, non_null(:string)
    # field :inserted_at, :datetime
  end

  object :post do
    field :id, non_null(:id)
    field :external_id, non_null(:string)
    field :title, :string
    field :desc, :string
    field :likes, :integer
  end

  mutation do
    field :create_post, type: :post do
      arg(:external_id, non_null(:string))
      arg(:title, :string)
      arg(:desc, :string)
      arg(:likes, :integer)

      resolve(&Posts.new_post/3)
    end
  end

  query do
    @desc "All end users"
    field :users, non_null(list_of(non_null(:end_user))) do
      resolve(&Users.all_end_users/3)
    end

    @desc "All posts"
    field :all_posts, non_null(list_of(non_null(:post))) do
      resolve(&Posts.get_all_posts/3)
    end
  end

  # query :scond do
  #   @desc "All posts"
  #   field :all_posts, non_null(list_of(non_null(:post))) do
  #     resolve(&Posts.get_all_posts/3)
  #   end
  # end
end
