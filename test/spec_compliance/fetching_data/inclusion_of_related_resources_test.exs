defmodule AshJsonApiTest.FetchingData.InclusionOfRelatedResources do
  use ExUnit.Case
  # @router_opts AshJsonApi.Test.Router.init([])
  @moduletag :json_api_spec_1_0

  defmodule Author do
    use Ash.Resource,
      domain: AshJsonApiTest.FetchingData.InclusionOfRelatedResources.Domain,
      data_layer: Ash.DataLayer.Ets,
      extensions: [AshJsonApi.Resource]

    ets do
      private?(true)
    end

    json_api do
      type("author")

      routes do
        base("/authors")
        get(:read)
        index(:read)
      end

      includes posts: [:author]
    end

    attributes do
      uuid_primary_key(:id)
      attribute(:name, :string, public?: true)
    end

    actions do
      default_accept(:*)
      defaults([:create, :read, :update, :destroy])
    end

    relationships do
      has_many(:posts, AshJsonApiTest.FetchingData.InclusionOfRelatedResources.Post,
        public?: true,
        destination_attribute: :author_id
      )
    end
  end

  defmodule Post do
    use Ash.Resource,
      domain: AshJsonApiTest.FetchingData.InclusionOfRelatedResources.Domain,
      data_layer: Ash.DataLayer.Ets,
      extensions: [AshJsonApi.Resource]

    actions do
      default_accept(:*)
      defaults([:create, :read, :update, :destroy])
    end

    ets do
      private?(true)
    end

    json_api do
      type("post")

      routes do
        base("/posts")
        get(:read)
        index(:read)
      end

      includes author: [:posts]
    end

    attributes do
      uuid_primary_key(:id)
      attribute(:name, :string, public?: true)
    end

    relationships do
      belongs_to(:author, Author, public?: true)
    end
  end

  defmodule Domain do
    use Ash.Domain,
      extensions: [
        AshJsonApi.Domain
      ]

    json_api do
      router(AshJsonApiTest.FetchingData.InclusionOfRelatedResources.Router)
    end

    resources do
      resource(Author)
      resource(Post)
    end
  end

  defmodule Router do
    use AshJsonApi.Router, domain: Domain
  end

  import AshJsonApi.Test

  # credo:disable-for-this-file Credo.Check.Readability.MaxLineLength

  @tag :spec_may
  # JSON:API 1.0 Specification
  # --------------------------
  # An endpoint MAY return resources related to the primary data by default.
  # --------------------------
  describe "default related resources" do
    # Do we want to implement this?
  end

  @tag :spec_may
  # JSON:API 1.0 Specification
  # --------------------------
  # An endpoint MAY also support an include request parameter to allow the client to customize which related resources should be returned.
  # --------------------------
  describe "include request parameter" do
    test "resource endpoint with include param of to-one relationship (linkage)" do
      # GET /posts/1?include=author
      author =
        Author
        |> Ash.Changeset.for_create(:create, %{name: "foo"})
        |> Ash.create!()

      author_id = author.id

      post =
        Post
        |> Ash.Changeset.for_create(:create, %{name: "foo"})
        |> Ash.Changeset.manage_relationship(:author, author, type: :append_and_remove)
        |> Ash.create!()

      assert %{
               resp_body: %{
                 "data" => %{
                   "relationships" => %{
                     "author" => %{"data" => %{"id" => ^author_id, "type" => "author"}}
                   }
                 }
               }
             } = get(Domain, "/posts/#{post.id}/?include=author", status: 200)
    end

    test "resource endpoint with include param of to-one relationship (inclusion)" do
      # GET /posts/1?include=author
      author =
        Author
        |> Ash.Changeset.for_create(:create, %{name: "foo"})
        |> Ash.create!()

      author_id = author.id

      post =
        Post
        |> Ash.Changeset.for_create(:create, %{name: "foo"})
        |> Ash.Changeset.manage_relationship(:author, author, type: :append_and_remove)
        |> Ash.create!()

      Domain
      |> get("/posts/#{post.id}/?include=author", status: 200)
      |> assert_has_matching_include(fn
        %{"type" => "author", "id" => ^author_id} ->
          true

        _ ->
          false
      end)
    end

    test "resource endpoint with include param of to-many relationship" do
      # GET /posts/1?include=comments
    end

    test "resource endpoint with include param of multiple relationships" do
      # GET /posts/1?include=author,comments
    end

    test "resource endpoint with include param of one-level nested relationship" do
      # GET /posts/1?include=author.posts
      # intermediate resources in a multi-part path must be returned along with the leaf nodes. For example, a response to a request for comments.author should include comments as well as the author of each of those comments.
    end

    test "resource endpoint with relationship alias" do
      # Note: A server may choose to expose a deeply nested relationship such as comments.author as a direct relationship with an alias such as comment-authors. This would allow a client to request /articles/1?include=comment-authors instead of /articles/1?include=comments.author. By abstracting the nested relationship with an alias, the server can still provide full linkage in compound documents without including potentially unwanted intermediate resources.
    end

    test "resource endpoint with include param of overlapping resources" do
      # rename this because I don't know if I fully captured the concept
      # I specifically want to test behavior around the author for the primary resource vs the nested authors
      # GET /articles/1?include=author,comments.author HTTP/1.1
    end

    test "resource endpoint with include param of multiple one-level nested relationship" do
      # GET /articles/1?include=author.posts,comments.user
    end

    test "resource endpoint with include param of two-level nested relationship" do
      # GET /posts/1?include=author.posts.comments
    end

    test "resource endpoint with include param of three-level nested relationship" do
      # GET /posts/1?include=author.posts.comments.user
    end

    test "relationship endpoints with include param" do
      # GET /articles/1/relationships/comments?include=comments.author HTTP/1.1
      # In this case, the primary data would be a collection of resource identifier objects that represent linkage to comments for an article, while the full comments and comment authors would be returned as included data.
      # Do we need to run all the above tests on a to-one and to-many relationship endpoint?
    end
  end

  # I put this as "may" because loading is an optional feature
  @tag :spec_may
  # JSON:API 1.0 Specification
  # --------------------------
  # If an endpoint does not support the include parameter, it MUST respond with 400 Bad Request to any requests that include it.
  # --------------------------
  describe "400 Bad Request for requests that with include parameter for endpoints without include parameter support" do
    # GET /posts/1?include=foobar
    author =
      Author
      |> Ash.Changeset.for_create(:create, %{name: "foo"})
      |> Ash.create!()

    post =
      Post
      |> Ash.Changeset.for_create(:create, %{name: "foo"})
      |> Ash.Changeset.manage_relationship(:author, author, type: :append_and_remove)
      |> Ash.create!()

    get(Domain, "/posts/#{post.id}/?include=foobar", status: 400)
  end

  # I put this as "may" because loading is an optional feature
  @tag :spec_may
  # JSON:API 1.0 Specification
  # --------------------------
  # If an endpoint supports the include parameter and a client supplies it, the server MUST NOT include unrequested resource objects in the included section of the compound document.
  # --------------------------
  describe "No unrequested resource objects when using the include parameter" do
    # This is testing a negative, which is hard to do.
    # Perhaps this test is better done as part of a higher level test suite validation that runs every single time a request in the test suite is made (and validates against the JSON:API schema as one step)?
  end

  # I put this as "may" because loading is an optional feature
  @tag :spec_may
  # JSON:API 1.0 Specification
  # --------------------------
  # The value of the include parameter MUST be a comma-separated (U+002C COMMA, “,”) list of relationship paths. A relationship path is a dot-separated (U+002E FULL-STOP, “.”) list of relationship names.
  # --------------------------
  describe "include parameter value" do
    # Not sure how to test this - seems like a client issue, and other tests should cover this in the error case
  end

  @tag :spec_must
  # JSON:API 1.0 Specification
  # --------------------------
  # If a server is unable to identify a relationship path or does not support inclusion of resources from a path, it MUST respond with 400 Bad Request.
  # --------------------------
  describe "400 Bad Request for unidentified relationships." do
    test "incorrect relationship path" do
      # GET /posts/1/relationships/foo
    end

    test "incorrect include param" do
      # GET /posts/1?include=foo
    end
  end

  # figure out if this note in the spec needs to be addressed, or if it will be covered from other statements
  # Note: This section applies to any endpoint that responds with primary data, regardless of the request type. For instance, a server could support the inclusion of related resources along with a POST request to create a resource or relationship.
end
