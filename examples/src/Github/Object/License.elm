module Github.Object.License exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.License
selection constructor =
    Object.object constructor


{-| The full text of the license
-}
body : FieldDecoder String Github.Object.License
body =
    Object.fieldDecoder "body" [] Decode.string


{-| The conditions set by the license
-}
conditions : SelectionSet conditions Github.Object.LicenseRule -> FieldDecoder (List (Maybe conditions)) Github.Object.License
conditions object =
    Object.selectionFieldDecoder "conditions" [] object (identity >> Decode.maybe >> Decode.list)


{-| A human-readable description of the license
-}
description : FieldDecoder (Maybe String) Github.Object.License
description =
    Object.fieldDecoder "description" [] (Decode.string |> Decode.maybe)


{-| Whether the license should be featured
-}
featured : FieldDecoder Bool Github.Object.License
featured =
    Object.fieldDecoder "featured" [] Decode.bool


{-| Whether the license should be displayed in license pickers
-}
hidden : FieldDecoder Bool Github.Object.License
hidden =
    Object.fieldDecoder "hidden" [] Decode.bool


id : FieldDecoder String Github.Object.License
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Instructions on how to implement the license
-}
implementation : FieldDecoder (Maybe String) Github.Object.License
implementation =
    Object.fieldDecoder "implementation" [] (Decode.string |> Decode.maybe)


{-| The lowercased SPDX ID of the license
-}
key : FieldDecoder String Github.Object.License
key =
    Object.fieldDecoder "key" [] Decode.string


{-| The limitations set by the license
-}
limitations : SelectionSet limitations Github.Object.LicenseRule -> FieldDecoder (List (Maybe limitations)) Github.Object.License
limitations object =
    Object.selectionFieldDecoder "limitations" [] object (identity >> Decode.maybe >> Decode.list)


{-| The license full name specified by <https://spdx.org/licenses>
-}
name : FieldDecoder String Github.Object.License
name =
    Object.fieldDecoder "name" [] Decode.string


{-| Customary short name if applicable (e.g, GPLv3)
-}
nickname : FieldDecoder (Maybe String) Github.Object.License
nickname =
    Object.fieldDecoder "nickname" [] (Decode.string |> Decode.maybe)


{-| The permissions set by the license
-}
permissions : SelectionSet permissions Github.Object.LicenseRule -> FieldDecoder (List (Maybe permissions)) Github.Object.License
permissions object =
    Object.selectionFieldDecoder "permissions" [] object (identity >> Decode.maybe >> Decode.list)


{-| Short identifier specified by <https://spdx.org/licenses>
-}
spdxId : FieldDecoder (Maybe String) Github.Object.License
spdxId =
    Object.fieldDecoder "spdxId" [] (Decode.string |> Decode.maybe)


{-| URL to the license on <https://choosealicense.com>
-}
url : FieldDecoder (Maybe String) Github.Object.License
url =
    Object.fieldDecoder "url" [] (Decode.string |> Decode.maybe)
