module Github.Object.OrganizationInvitation exposing (..)

import Github.Enum.OrganizationInvitationRole
import Github.Enum.OrganizationInvitationType
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.OrganizationInvitation
selection constructor =
    Object.object constructor


{-| The email address of the user invited to the organization.
-}
email : FieldDecoder (Maybe String) Github.Object.OrganizationInvitation
email =
    Object.fieldDecoder "email" [] (Decode.string |> Decode.maybe)


id : FieldDecoder String Github.Object.OrganizationInvitation
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The type of invitation that was sent (e.g. email, user).
-}
invitationType : FieldDecoder Github.Enum.OrganizationInvitationType.OrganizationInvitationType Github.Object.OrganizationInvitation
invitationType =
    Object.fieldDecoder "invitationType" [] Github.Enum.OrganizationInvitationType.decoder


{-| The user who was invited to the organization.
-}
invitee : SelectionSet invitee Github.Object.User -> FieldDecoder (Maybe invitee) Github.Object.OrganizationInvitation
invitee object =
    Object.selectionFieldDecoder "invitee" [] object (identity >> Decode.maybe)


{-| The user who created the invitation.
-}
inviter : SelectionSet inviter Github.Object.User -> FieldDecoder inviter Github.Object.OrganizationInvitation
inviter object =
    Object.selectionFieldDecoder "inviter" [] object identity


{-| The user's pending role in the organization (e.g. member, owner).
-}
role : FieldDecoder Github.Enum.OrganizationInvitationRole.OrganizationInvitationRole Github.Object.OrganizationInvitation
role =
    Object.fieldDecoder "role" [] Github.Enum.OrganizationInvitationRole.decoder
