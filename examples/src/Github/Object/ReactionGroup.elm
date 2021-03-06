module Github.Object.ReactionGroup exposing (..)

import Github.Enum.ReactionContent
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.ReactionGroup
selection constructor =
    Object.object constructor


{-| Identifies the emoji reaction.
-}
content : FieldDecoder Github.Enum.ReactionContent.ReactionContent Github.Object.ReactionGroup
content =
    Object.fieldDecoder "content" [] Github.Enum.ReactionContent.decoder


{-| Identifies when the reaction was created.
-}
createdAt : FieldDecoder (Maybe String) Github.Object.ReactionGroup
createdAt =
    Object.fieldDecoder "createdAt" [] (Decode.string |> Decode.maybe)


{-| The subject that was reacted to.
-}
subject : SelectionSet subject Github.Object.Reactable -> FieldDecoder subject Github.Object.ReactionGroup
subject object =
    Object.selectionFieldDecoder "subject" [] object identity


{-| Users who have reacted to the reaction subject with the emotion represented by this reaction group

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
users : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet users Github.Object.ReactingUserConnection -> FieldDecoder users Github.Object.ReactionGroup
users fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "users" optionalArgs object identity


{-| Whether or not the authenticated user has left a reaction on the subject.
-}
viewerHasReacted : FieldDecoder Bool Github.Object.ReactionGroup
viewerHasReacted =
    Object.fieldDecoder "viewerHasReacted" [] Decode.bool
