module Github.Object.IssueEdge exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.IssueEdge
selection constructor =
    Object.object constructor


{-| A cursor for use in pagination.
-}
cursor : FieldDecoder String Github.Object.IssueEdge
cursor =
    Object.fieldDecoder "cursor" [] Decode.string


{-| The item at the end of the edge.
-}
node : SelectionSet node Github.Object.Issue -> FieldDecoder (Maybe node) Github.Object.IssueEdge
node object =
    Object.selectionFieldDecoder "node" [] object (identity >> Decode.maybe)
