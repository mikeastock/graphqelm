module Github.Object.Language exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Language
selection constructor =
    Object.object constructor


{-| The color defined for the current language.
-}
color : FieldDecoder (Maybe String) Github.Object.Language
color =
    Object.fieldDecoder "color" [] (Decode.string |> Decode.maybe)


id : FieldDecoder String Github.Object.Language
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The name of the current language.
-}
name : FieldDecoder String Github.Object.Language
name =
    Object.fieldDecoder "name" [] Decode.string
