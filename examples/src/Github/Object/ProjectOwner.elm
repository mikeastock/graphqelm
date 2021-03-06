module Github.Object.ProjectOwner exposing (..)

import Github.Enum.ProjectState
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.ProjectOwner
selection constructor =
    Object.object constructor


id : FieldDecoder String Github.Object.ProjectOwner
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Find project by number.

  - number - The project number to find.

-}
project : { number : Int } -> SelectionSet project Github.Object.Project -> FieldDecoder (Maybe project) Github.Object.ProjectOwner
project requiredArgs object =
    Object.selectionFieldDecoder "project" [ Argument.required "number" requiredArgs.number Encode.int ] object (identity >> Decode.maybe)


{-| A list of projects under the owner.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - orderBy - Ordering options for projects returned from the connection
  - search - Query to search projects by, currently only searching by name.
  - states - A list of states to filter the projects by.

-}
projects : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, orderBy : OptionalArgument Value, search : OptionalArgument String, states : OptionalArgument (List Github.Enum.ProjectState.ProjectState) } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, orderBy : OptionalArgument Value, search : OptionalArgument String, states : OptionalArgument (List Github.Enum.ProjectState.ProjectState) }) -> SelectionSet projects Github.Object.ProjectConnection -> FieldDecoder projects Github.Object.ProjectOwner
projects fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, orderBy = Absent, search = Absent, states = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy identity, Argument.optional "search" filledInOptionals.search Encode.string, Argument.optional "states" filledInOptionals.states (Encode.enum toString |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "projects" optionalArgs object identity


{-| The HTTP path listing owners projects
-}
projectsResourcePath : FieldDecoder String Github.Object.ProjectOwner
projectsResourcePath =
    Object.fieldDecoder "projectsResourcePath" [] Decode.string


{-| The HTTP URL listing owners projects
-}
projectsUrl : FieldDecoder String Github.Object.ProjectOwner
projectsUrl =
    Object.fieldDecoder "projectsUrl" [] Decode.string


{-| Can the current viewer create new projects on this owner.
-}
viewerCanCreateProjects : FieldDecoder Bool Github.Object.ProjectOwner
viewerCanCreateProjects =
    Object.fieldDecoder "viewerCanCreateProjects" [] Decode.bool
