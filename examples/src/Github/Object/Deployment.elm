module Github.Object.Deployment exposing (..)

import Github.Enum.DeploymentState
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Deployment
selection constructor =
    Object.object constructor


{-| Identifies the commit sha of the deployment.
-}
commit : SelectionSet commit Github.Object.Commit -> FieldDecoder (Maybe commit) Github.Object.Deployment
commit object =
    Object.selectionFieldDecoder "commit" [] object (identity >> Decode.maybe)


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder String Github.Object.Deployment
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


{-| Identifies the actor who triggered the deployment.
-}
creator : SelectionSet creator Github.Object.Actor -> FieldDecoder (Maybe creator) Github.Object.Deployment
creator object =
    Object.selectionFieldDecoder "creator" [] object (identity >> Decode.maybe)


{-| Identifies the primary key from the database.
-}
databaseId : FieldDecoder (Maybe Int) Github.Object.Deployment
databaseId =
    Object.fieldDecoder "databaseId" [] (Decode.int |> Decode.maybe)


{-| The environment to which this deployment was made.
-}
environment : FieldDecoder (Maybe String) Github.Object.Deployment
environment =
    Object.fieldDecoder "environment" [] (Decode.string |> Decode.maybe)


id : FieldDecoder String Github.Object.Deployment
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The latest status of this deployment.
-}
latestStatus : SelectionSet latestStatus Github.Object.DeploymentStatus -> FieldDecoder (Maybe latestStatus) Github.Object.Deployment
latestStatus object =
    Object.selectionFieldDecoder "latestStatus" [] object (identity >> Decode.maybe)


{-| Extra information that a deployment system might need.
-}
payload : FieldDecoder (Maybe String) Github.Object.Deployment
payload =
    Object.fieldDecoder "payload" [] (Decode.string |> Decode.maybe)


{-| Identifies the repository associated with the deployment.
-}
repository : SelectionSet repository Github.Object.Repository -> FieldDecoder repository Github.Object.Deployment
repository object =
    Object.selectionFieldDecoder "repository" [] object identity


{-| The current state of the deployment.
-}
state : FieldDecoder (Maybe Github.Enum.DeploymentState.DeploymentState) Github.Object.Deployment
state =
    Object.fieldDecoder "state" [] (Github.Enum.DeploymentState.decoder |> Decode.maybe)


{-| A list of statuses associated with the deployment.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
statuses : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet statuses Github.Object.DeploymentStatusConnection -> FieldDecoder (Maybe statuses) Github.Object.Deployment
statuses fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "statuses" optionalArgs object (identity >> Decode.maybe)
