defmodule ProjectTidesWeb.Schema.MessageTagTypes do
  use Absinthe.Schema.Notation
  import Absinthe.Resolution.Helpers, only: [dataloader: 1]

  alias ProjectTidesWeb.{Resolvers}
  alias ProjectTides.MessagesTags.MessageTag

  object :message_tag_result do
    field :message_tag, :message_tag
    field :errors, list_of(:input_error)
  end

  object :message_tag do
    field :id, :id

    field :message, :message do
      resolve(dataloader(MessageTag))
    end

    field :tag, :tag do
      resolve(dataloader(MessageTag))
    end
  end

  input_object :message_tag_input do
    field :message_id, :id
    field :tag_id, :id
  end

  object :message_tag_queries do
    @desc "get the details of one messages tags"
    field :message_tag, :message_tag_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.MessageTag.message_tag/3)
    end
  end

  object :message_tag_mutations do
    field :create_message_tag, :message_tag_result do
      arg(:input, non_null(:message_tag_input))
      resolve(&Resolvers.MessageTag.create_message_tag/3)
    end

    field :update_message_tag, :message_tag_result do
      arg(:id, non_null(:id))
      arg(:input, :message_tag_input)
      resolve(&Resolvers.MessageTag.update_message_tag/3)
    end

    field :delete_message_tag, :message_tag_result do
      arg(:id, non_null(:id))
      resolve(&Resolvers.MessageTag.delete_message_tag/3)
    end
  end
end
