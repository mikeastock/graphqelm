module Github.Object.SubscribedEvent exposing (..)

import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.SubscribedEvent
selection constructor =
    Object.object constructor


{-| Identifies the actor who performed the event.
-}
actor : SelectionSet actor Github.Object.Actor -> FieldDecoder (Maybe actor) Github.Object.SubscribedEvent
actor object =
    Object.selectionFieldDecoder "actor" [] object (identity >> Decode.maybe)


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder String Github.Object.SubscribedEvent
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


id : FieldDecoder String Github.Object.SubscribedEvent
id =
    Object.fieldDecoder "id" [] Decode.string


{-| Object referenced by event.
-}
subscribable : SelectionSet subscribable Github.Object.Subscribable -> FieldDecoder subscribable Github.Object.SubscribedEvent
subscribable object =
    Object.selectionFieldDecoder "subscribable" [] object identity
