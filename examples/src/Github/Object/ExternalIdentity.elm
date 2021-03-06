module Github.Object.ExternalIdentity exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.ExternalIdentity
selection constructor =
    Object.object constructor


{-| The GUID for this identity
-}
guid : FieldDecoder String Github.Object.ExternalIdentity
guid =
    Object.fieldDecoder "guid" [] Decode.string


id : FieldDecoder String Github.Object.ExternalIdentity
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Organization invitation for this SCIM-provisioned external identity
-}
organizationInvitation : SelectionSet organizationInvitation Github.Object.OrganizationInvitation -> FieldDecoder (Maybe organizationInvitation) Github.Object.ExternalIdentity
organizationInvitation object =
    Object.selectionFieldDecoder "organizationInvitation" [] object (identity >> Decode.maybe)


{-| SAML Identity attributes
-}
samlIdentity : SelectionSet samlIdentity Github.Object.ExternalIdentitySamlAttributes -> FieldDecoder (Maybe samlIdentity) Github.Object.ExternalIdentity
samlIdentity object =
    Object.selectionFieldDecoder "samlIdentity" [] object (identity >> Decode.maybe)


{-| SCIM Identity attributes
-}
scimIdentity : SelectionSet scimIdentity Github.Object.ExternalIdentityScimAttributes -> FieldDecoder (Maybe scimIdentity) Github.Object.ExternalIdentity
scimIdentity object =
    Object.selectionFieldDecoder "scimIdentity" [] object (identity >> Decode.maybe)


{-| User linked to this external identity
-}
user : SelectionSet user Github.Object.User -> FieldDecoder (Maybe user) Github.Object.ExternalIdentity
user object =
    Object.selectionFieldDecoder "user" [] object (identity >> Decode.maybe)
