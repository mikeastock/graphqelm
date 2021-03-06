module Github.Object.Comment exposing (..)

import Github.Enum.CommentAuthorAssociation
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.Comment
selection constructor =
    Object.object constructor


{-| The actor who authored the comment.
-}
author : SelectionSet author Github.Object.Actor -> FieldDecoder (Maybe author) Github.Object.Comment
author object =
    Object.selectionFieldDecoder "author" [] object (identity >> Decode.maybe)


{-| Author's association with the subject of the comment.
-}
authorAssociation : FieldDecoder Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Object.Comment
authorAssociation =
    Object.fieldDecoder "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


{-| The comment body as Markdown.
-}
body : FieldDecoder String Github.Object.Comment
body =
    Object.fieldDecoder "body" [] Decode.string


{-| The comment body rendered to HTML.
-}
bodyHTML : FieldDecoder String Github.Object.Comment
bodyHTML =
    Object.fieldDecoder "bodyHTML" [] Decode.string


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder String Github.Object.Comment
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


{-| Check if this comment was created via an email reply.
-}
createdViaEmail : FieldDecoder Bool Github.Object.Comment
createdViaEmail =
    Object.fieldDecoder "createdViaEmail" [] Decode.bool


{-| The actor who edited the comment.
-}
editor : SelectionSet editor Github.Object.Actor -> FieldDecoder (Maybe editor) Github.Object.Comment
editor object =
    Object.selectionFieldDecoder "editor" [] object (identity >> Decode.maybe)


id : FieldDecoder String Github.Object.Comment
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The moment the editor made the last edit
-}
lastEditedAt : FieldDecoder (Maybe String) Github.Object.Comment
lastEditedAt =
    Object.fieldDecoder "lastEditedAt" [] (Decode.string |> Decode.maybe)


{-| Identifies when the comment was published at.
-}
publishedAt : FieldDecoder (Maybe String) Github.Object.Comment
publishedAt =
    Object.fieldDecoder "publishedAt" [] (Decode.string |> Decode.maybe)


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : FieldDecoder String Github.Object.Comment
updatedAt =
    Object.fieldDecoder "updatedAt" [] Decode.string


{-| Did the viewer author this comment.
-}
viewerDidAuthor : FieldDecoder Bool Github.Object.Comment
viewerDidAuthor =
    Object.fieldDecoder "viewerDidAuthor" [] Decode.bool
