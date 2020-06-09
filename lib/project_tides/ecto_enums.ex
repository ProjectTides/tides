# Build the enums for ecto to consume in an easy manner
import EctoEnum

require ProjectTides.Enums

defenum(
  ProjectTides.APIStatusEnum,
  :api_status_enum,
  ProjectTides.Enums.api_status_const()
)

defenum(
  ProjectTides.ContactStatusEnum,
  :contact_status_enum,
  ProjectTides.Enums.contact_status_const()
)

defenum(
  ProjectTides.MessageFlowEnum,
  :message_flow_enum,
  ProjectTides.Enums.message_flow_const()
)

defenum(
  ProjectTides.MessageStatusEnum,
  :message_status_enum,
  ProjectTides.Enums.message_status_const()
)

defenum(
  ProjectTides.MessageTypesEnum,
  :message_types_enum,
  ProjectTides.Enums.message_types_const()
)

defenum(
  ProjectTides.SortOrderEnum,
  :sort_order_enum,
  ProjectTides.Enums.sort_order_const()
)
