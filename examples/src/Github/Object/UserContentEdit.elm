module Github.Object.UserContentEdit exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.UserContentEdit
selection constructor =
    Object.object constructor


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder String Github.Object.UserContentEdit
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


{-| The actor who edited this content,
-}
editor : SelectionSet editor Github.Object.Actor -> FieldDecoder (Maybe editor) Github.Object.UserContentEdit
editor object =
    Object.selectionFieldDecoder "editor" [] object (identity >> Decode.maybe)


id : FieldDecoder String Github.Object.UserContentEdit
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : FieldDecoder String Github.Object.UserContentEdit
updatedAt =
    Object.fieldDecoder "updatedAt" [] Decode.string
