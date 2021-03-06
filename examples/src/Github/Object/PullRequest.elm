module Github.Object.PullRequest exposing (..)

import Github.Enum.CommentAuthorAssociation
import Github.Enum.CommentCannotUpdateReason
import Github.Enum.MergeableState
import Github.Enum.PullRequestReviewState
import Github.Enum.PullRequestState
import Github.Enum.ReactionContent
import Github.Enum.SubscriptionState
import Github.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.Builder.Object as Object
import Graphqelm.Encode as Encode exposing (Value)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import Graphqelm.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


selection : (a -> constructor) -> SelectionSet (a -> constructor) Github.Object.PullRequest
selection constructor =
    Object.object constructor


{-| The number of additions in this pull request.
-}
additions : FieldDecoder Int Github.Object.PullRequest
additions =
    Object.fieldDecoder "additions" [] Decode.int


{-| A list of Users assigned to this object.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
assignees : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet assignees Github.Object.UserConnection -> FieldDecoder assignees Github.Object.PullRequest
assignees fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "assignees" optionalArgs object identity


{-| The actor who authored the comment.
-}
author : SelectionSet author Github.Object.Actor -> FieldDecoder (Maybe author) Github.Object.PullRequest
author object =
    Object.selectionFieldDecoder "author" [] object (identity >> Decode.maybe)


{-| Author's association with the subject of the comment.
-}
authorAssociation : FieldDecoder Github.Enum.CommentAuthorAssociation.CommentAuthorAssociation Github.Object.PullRequest
authorAssociation =
    Object.fieldDecoder "authorAssociation" [] Github.Enum.CommentAuthorAssociation.decoder


{-| Identifies the base Ref associated with the pull request.
-}
baseRef : SelectionSet baseRef Github.Object.Ref -> FieldDecoder (Maybe baseRef) Github.Object.PullRequest
baseRef object =
    Object.selectionFieldDecoder "baseRef" [] object (identity >> Decode.maybe)


{-| Identifies the name of the base Ref associated with the pull request, even if the ref has been deleted.
-}
baseRefName : FieldDecoder String Github.Object.PullRequest
baseRefName =
    Object.fieldDecoder "baseRefName" [] Decode.string


{-| Identifies the body of the pull request.
-}
body : FieldDecoder String Github.Object.PullRequest
body =
    Object.fieldDecoder "body" [] Decode.string


{-| Identifies the body of the pull request rendered to HTML.
-}
bodyHTML : FieldDecoder String Github.Object.PullRequest
bodyHTML =
    Object.fieldDecoder "bodyHTML" [] Decode.string


{-| Identifies the body of the pull request rendered to text.
-}
bodyText : FieldDecoder String Github.Object.PullRequest
bodyText =
    Object.fieldDecoder "bodyText" [] Decode.string


{-| The number of changed files in this pull request.
-}
changedFiles : FieldDecoder Int Github.Object.PullRequest
changedFiles =
    Object.fieldDecoder "changedFiles" [] Decode.int


{-| `true` if the pull request is closed
-}
closed : FieldDecoder Bool Github.Object.PullRequest
closed =
    Object.fieldDecoder "closed" [] Decode.bool


{-| Identifies the date and time when the object was closed.
-}
closedAt : FieldDecoder (Maybe String) Github.Object.PullRequest
closedAt =
    Object.fieldDecoder "closedAt" [] (Decode.string |> Decode.maybe)


{-| A list of comments associated with the pull request.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
comments : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet comments Github.Object.IssueCommentConnection -> FieldDecoder comments Github.Object.PullRequest
comments fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "comments" optionalArgs object identity


{-| A list of commits present in this pull request's head branch not present in the base branch.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
commits : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet commits Github.Object.PullRequestCommitConnection -> FieldDecoder commits Github.Object.PullRequest
commits fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "commits" optionalArgs object identity


{-| Identifies the date and time when the object was created.
-}
createdAt : FieldDecoder String Github.Object.PullRequest
createdAt =
    Object.fieldDecoder "createdAt" [] Decode.string


{-| Check if this comment was created via an email reply.
-}
createdViaEmail : FieldDecoder Bool Github.Object.PullRequest
createdViaEmail =
    Object.fieldDecoder "createdViaEmail" [] Decode.bool


{-| Identifies the primary key from the database.
-}
databaseId : FieldDecoder (Maybe Int) Github.Object.PullRequest
databaseId =
    Object.fieldDecoder "databaseId" [] (Decode.int |> Decode.maybe)


{-| The number of deletions in this pull request.
-}
deletions : FieldDecoder Int Github.Object.PullRequest
deletions =
    Object.fieldDecoder "deletions" [] Decode.int


{-| The actor who edited this pull request's body.
-}
editor : SelectionSet editor Github.Object.Actor -> FieldDecoder (Maybe editor) Github.Object.PullRequest
editor object =
    Object.selectionFieldDecoder "editor" [] object (identity >> Decode.maybe)


{-| Identifies the head Ref associated with the pull request.
-}
headRef : SelectionSet headRef Github.Object.Ref -> FieldDecoder (Maybe headRef) Github.Object.PullRequest
headRef object =
    Object.selectionFieldDecoder "headRef" [] object (identity >> Decode.maybe)


{-| Identifies the name of the head Ref associated with the pull request, even if the ref has been deleted.
-}
headRefName : FieldDecoder String Github.Object.PullRequest
headRefName =
    Object.fieldDecoder "headRefName" [] Decode.string


{-| The repository associated with this pull request's head Ref.
-}
headRepository : SelectionSet headRepository Github.Object.Repository -> FieldDecoder (Maybe headRepository) Github.Object.PullRequest
headRepository object =
    Object.selectionFieldDecoder "headRepository" [] object (identity >> Decode.maybe)


{-| The owner of the repository associated with this pull request's head Ref.
-}
headRepositoryOwner : SelectionSet headRepositoryOwner Github.Object.RepositoryOwner -> FieldDecoder (Maybe headRepositoryOwner) Github.Object.PullRequest
headRepositoryOwner object =
    Object.selectionFieldDecoder "headRepositoryOwner" [] object (identity >> Decode.maybe)


id : FieldDecoder String Github.Object.PullRequest
id =
    Object.fieldDecoder "id" [] Decode.string


{-| The head and base repositories are different.
-}
isCrossRepository : FieldDecoder Bool Github.Object.PullRequest
isCrossRepository =
    Object.fieldDecoder "isCrossRepository" [] Decode.bool


{-| A list of labels associated with the object.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
labels : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet labels Github.Object.LabelConnection -> FieldDecoder (Maybe labels) Github.Object.PullRequest
labels fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "labels" optionalArgs object (identity >> Decode.maybe)


{-| The moment the editor made the last edit
-}
lastEditedAt : FieldDecoder (Maybe String) Github.Object.PullRequest
lastEditedAt =
    Object.fieldDecoder "lastEditedAt" [] (Decode.string |> Decode.maybe)


{-| `true` if the pull request is locked
-}
locked : FieldDecoder Bool Github.Object.PullRequest
locked =
    Object.fieldDecoder "locked" [] Decode.bool


{-| The commit that was created when this pull request was merged.
-}
mergeCommit : SelectionSet mergeCommit Github.Object.Commit -> FieldDecoder (Maybe mergeCommit) Github.Object.PullRequest
mergeCommit object =
    Object.selectionFieldDecoder "mergeCommit" [] object (identity >> Decode.maybe)


{-| Whether or not the pull request can be merged based on the existence of merge conflicts.
-}
mergeable : FieldDecoder Github.Enum.MergeableState.MergeableState Github.Object.PullRequest
mergeable =
    Object.fieldDecoder "mergeable" [] Github.Enum.MergeableState.decoder


{-| Whether or not the pull request was merged.
-}
merged : FieldDecoder Bool Github.Object.PullRequest
merged =
    Object.fieldDecoder "merged" [] Decode.bool


{-| The date and time that the pull request was merged.
-}
mergedAt : FieldDecoder (Maybe String) Github.Object.PullRequest
mergedAt =
    Object.fieldDecoder "mergedAt" [] (Decode.string |> Decode.maybe)


{-| Identifies the milestone associated with the pull request.
-}
milestone : SelectionSet milestone Github.Object.Milestone -> FieldDecoder (Maybe milestone) Github.Object.PullRequest
milestone object =
    Object.selectionFieldDecoder "milestone" [] object (identity >> Decode.maybe)


{-| Identifies the pull request number.
-}
number : FieldDecoder Int Github.Object.PullRequest
number =
    Object.fieldDecoder "number" [] Decode.int


{-| A list of Users that are participating in the Pull Request conversation.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
participants : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet participants Github.Object.UserConnection -> FieldDecoder participants Github.Object.PullRequest
participants fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "participants" optionalArgs object identity


{-| The commit that GitHub automatically generated to test if this pull request could be merged. This field will not return a value if the pull request is merged, or if the test merge commit is still being generated. See the `mergeable` field for more details on the mergeability of the pull request.
-}
potentialMergeCommit : SelectionSet potentialMergeCommit Github.Object.Commit -> FieldDecoder (Maybe potentialMergeCommit) Github.Object.PullRequest
potentialMergeCommit object =
    Object.selectionFieldDecoder "potentialMergeCommit" [] object (identity >> Decode.maybe)


{-| List of project cards associated with this pull request.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
projectCards : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet projectCards Github.Object.ProjectCardConnection -> FieldDecoder projectCards Github.Object.PullRequest
projectCards fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "projectCards" optionalArgs object identity


{-| Identifies when the comment was published at.
-}
publishedAt : FieldDecoder (Maybe String) Github.Object.PullRequest
publishedAt =
    Object.fieldDecoder "publishedAt" [] (Decode.string |> Decode.maybe)


{-| A list of reactions grouped by content left on the subject.
-}
reactionGroups : SelectionSet reactionGroups Github.Object.ReactionGroup -> FieldDecoder (Maybe (List reactionGroups)) Github.Object.PullRequest
reactionGroups object =
    Object.selectionFieldDecoder "reactionGroups" [] object (identity >> Decode.list >> Decode.maybe)


{-| A list of Reactions left on the Issue.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - content - Allows filtering Reactions by emoji.
  - orderBy - Allows specifying the order in which reactions are returned.

-}
reactions : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, content : OptionalArgument Github.Enum.ReactionContent.ReactionContent, orderBy : OptionalArgument Value } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, content : OptionalArgument Github.Enum.ReactionContent.ReactionContent, orderBy : OptionalArgument Value }) -> SelectionSet reactions Github.Object.ReactionConnection -> FieldDecoder reactions Github.Object.PullRequest
reactions fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, content = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "content" filledInOptionals.content (Encode.enum toString), Argument.optional "orderBy" filledInOptionals.orderBy identity ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "reactions" optionalArgs object identity


{-| The repository associated with this node.
-}
repository : SelectionSet repository Github.Object.Repository -> FieldDecoder repository Github.Object.PullRequest
repository object =
    Object.selectionFieldDecoder "repository" [] object identity


{-| The HTTP path for this pull request.
-}
resourcePath : FieldDecoder String Github.Object.PullRequest
resourcePath =
    Object.fieldDecoder "resourcePath" [] Decode.string


{-| The HTTP path for reverting this pull request.
-}
revertResourcePath : FieldDecoder String Github.Object.PullRequest
revertResourcePath =
    Object.fieldDecoder "revertResourcePath" [] Decode.string


{-| The HTTP URL for reverting this pull request.
-}
revertUrl : FieldDecoder String Github.Object.PullRequest
revertUrl =
    Object.fieldDecoder "revertUrl" [] Decode.string


{-| A list of review requests associated with the pull request.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
reviewRequests : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String }) -> SelectionSet reviewRequests Github.Object.ReviewRequestConnection -> FieldDecoder (Maybe reviewRequests) Github.Object.PullRequest
reviewRequests fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "reviewRequests" optionalArgs object (identity >> Decode.maybe)


{-| A list of reviews associated with the pull request.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - states - A list of states to filter the reviews.
  - author - Filter by author of the review.

-}
reviews : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, states : OptionalArgument (List Github.Enum.PullRequestReviewState.PullRequestReviewState), author : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, states : OptionalArgument (List Github.Enum.PullRequestReviewState.PullRequestReviewState), author : OptionalArgument String }) -> SelectionSet reviews Github.Object.PullRequestReviewConnection -> FieldDecoder (Maybe reviews) Github.Object.PullRequest
reviews fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, states = Absent, author = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "states" filledInOptionals.states (Encode.enum toString |> Encode.list), Argument.optional "author" filledInOptionals.author Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "reviews" optionalArgs object (identity >> Decode.maybe)


{-| Identifies the state of the pull request.
-}
state : FieldDecoder Github.Enum.PullRequestState.PullRequestState Github.Object.PullRequest
state =
    Object.fieldDecoder "state" [] Github.Enum.PullRequestState.decoder


{-| A list of reviewer suggestions based on commit history and past review comments.
-}
suggestedReviewers : SelectionSet suggestedReviewers Github.Object.SuggestedReviewer -> FieldDecoder (List (Maybe suggestedReviewers)) Github.Object.PullRequest
suggestedReviewers object =
    Object.selectionFieldDecoder "suggestedReviewers" [] object (identity >> Decode.maybe >> Decode.list)


{-| A list of events, comments, commits, etc. associated with the pull request.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - since - Allows filtering timeline events by a `since` timestamp.

-}
timeline : ({ first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, since : OptionalArgument String } -> { first : OptionalArgument Int, after : OptionalArgument String, last : OptionalArgument Int, before : OptionalArgument String, since : OptionalArgument String }) -> SelectionSet timeline Github.Object.PullRequestTimelineConnection -> FieldDecoder timeline Github.Object.PullRequest
timeline fillInOptionals object =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, since = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "since" filledInOptionals.since Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionFieldDecoder "timeline" optionalArgs object identity


{-| Identifies the pull request title.
-}
title : FieldDecoder String Github.Object.PullRequest
title =
    Object.fieldDecoder "title" [] Decode.string


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : FieldDecoder String Github.Object.PullRequest
updatedAt =
    Object.fieldDecoder "updatedAt" [] Decode.string


{-| The HTTP URL for this pull request.
-}
url : FieldDecoder String Github.Object.PullRequest
url =
    Object.fieldDecoder "url" [] Decode.string


{-| Can user react to this subject
-}
viewerCanReact : FieldDecoder Bool Github.Object.PullRequest
viewerCanReact =
    Object.fieldDecoder "viewerCanReact" [] Decode.bool


{-| Check if the viewer is able to change their subscription status for the repository.
-}
viewerCanSubscribe : FieldDecoder Bool Github.Object.PullRequest
viewerCanSubscribe =
    Object.fieldDecoder "viewerCanSubscribe" [] Decode.bool


{-| Check if the current viewer can update this object.
-}
viewerCanUpdate : FieldDecoder Bool Github.Object.PullRequest
viewerCanUpdate =
    Object.fieldDecoder "viewerCanUpdate" [] Decode.bool


{-| Reasons why the current viewer can not update this comment.
-}
viewerCannotUpdateReasons : FieldDecoder (List Github.Enum.CommentCannotUpdateReason.CommentCannotUpdateReason) Github.Object.PullRequest
viewerCannotUpdateReasons =
    Object.fieldDecoder "viewerCannotUpdateReasons" [] (Github.Enum.CommentCannotUpdateReason.decoder |> Decode.list)


{-| Did the viewer author this comment.
-}
viewerDidAuthor : FieldDecoder Bool Github.Object.PullRequest
viewerDidAuthor =
    Object.fieldDecoder "viewerDidAuthor" [] Decode.bool


{-| Identifies if the viewer is watching, not watching, or ignoring the subscribable entity.
-}
viewerSubscription : FieldDecoder Github.Enum.SubscriptionState.SubscriptionState Github.Object.PullRequest
viewerSubscription =
    Object.fieldDecoder "viewerSubscription" [] Github.Enum.SubscriptionState.decoder
