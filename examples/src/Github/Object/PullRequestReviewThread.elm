module Github.Object.PullRequestReviewThread exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.PullRequestReviewThread
selection constructor =
    Object.object constructor


{-| A list of pull request comments associated with the thread.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
comments : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet comments Github.Object.PullRequestReviewCommentConnection -> FieldDecoder comments Github.Object.PullRequestReviewThread
comments fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "comments" optionalArgs object identity


id : FieldDecoder String Github.Object.PullRequestReviewThread
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Identifies the pull request associated with this thread.
-}
pullRequest : SelectionSet pullRequest Github.Object.PullRequest -> FieldDecoder pullRequest Github.Object.PullRequestReviewThread
pullRequest object =
    Object.selectionFieldDecoder "pullRequest" [] object identity


{-| Identifies the repository associated with this thread.
-}
repository : SelectionSet repository Github.Object.Repository -> FieldDecoder repository Github.Object.PullRequestReviewThread
repository object =
    Object.selectionFieldDecoder "repository" [] object identity
