module Github.Object.RepositoryOwner exposing (..)

import Github.Enum.RepositoryAffiliation
import Github.Enum.RepositoryPrivacy
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.RepositoryOwner
selection constructor =
    Object.object constructor


{-| A URL pointing to the owner's public avatar.

  - size - The size of the resulting square image.

-}
avatarUrl : ({ size : OptionalArgument Int } -> { size : OptionalArgument Int }) -> FieldDecoder String Github.Object.RepositoryOwner
avatarUrl fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { size = Absent }

        optionalArgs =
            [ Argument.optional "size" filledInOptionals.size Encode.int ]
                |> List.filterMap identity
    in
    Object.fieldDecoder "avatarUrl" optionalArgs Decode.string


id : FieldDecoder String Github.Object.RepositoryOwner
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The username used to login.
-}
login : FieldDecoder String Github.Object.RepositoryOwner
login =
    Object.fieldDecoder "login" [] Decode.string


{-| A list of repositories this user has pinned to their profile

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked

-}
pinnedRepositories : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool }) -> SelectionSet pinnedRepositories Github.Object.RepositoryConnection -> FieldDecoder pinnedRepositories Github.Object.RepositoryOwner
pinnedRepositories fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum toString), Argument.optional "orderBy" filledInOptionals.orderBy identity, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "pinnedRepositories" optionalArgs object identity


{-| A list of repositories that the user owns.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked
  - isFork - If non-null, filters repositories according to whether they are forks of another repository

-}
repositories : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool, isFork : OptionalArgument Bool } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy, orderBy : OptionalArgument Value, affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation)), isLocked : OptionalArgument Bool, isFork : OptionalArgument Bool }) -> SelectionSet repositories Github.Object.RepositoryConnection -> FieldDecoder repositories Github.Object.RepositoryOwner
repositories fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent, isFork = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum toString), Argument.optional "orderBy" filledInOptionals.orderBy identity, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool, Argument.optional "isFork" filledInOptionals.isFork Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "repositories" optionalArgs object identity


{-| Find Repository.

  - name - Name of Repository to find.

-}
repository : { name : String } -> SelectionSet repository Github.Object.Repository -> FieldDecoder (Maybe repository) Github.Object.RepositoryOwner
repository requiredArgs object =
    Object.selectionFieldDecoder "repository" [ Argument.required "name" requiredArgs.name Encode.string ] object (identity >> Decode.maybe)


{-| The HTTP URL for the owner.
-}
resourcePath : FieldDecoder String Github.Object.RepositoryOwner
resourcePath =
    Object.fieldDecoder "resourcePath" [] Decode.string


{-| The HTTP URL for the owner.
-}
url : FieldDecoder String Github.Object.RepositoryOwner
url =
    Object.fieldDecoder "url" [] Decode.string
