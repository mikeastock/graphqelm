module Graphqelm.Generator.Object exposing (..)

import Graphqelm.Generator.Field as FieldGenerator
import Graphqelm.Generator.Imports as Imports
import Graphqelm.Generator.SpecialObjectNames exposing (SpecialObjectNames)
import Graphqelm.Parser.Type as Type
import Interpolate exposing (interpolate)


generate : List String -> SpecialObjectNames -> String -> List Type.Field -> ( List String, String )
generate apiSubmodule specialObjectNames name fields =
    ( Imports.object apiSubmodule specialObjectNames name
    , prepend apiSubmodule (Imports.object apiSubmodule specialObjectNames name) fields
        ++ (List.map (FieldGenerator.generate apiSubmodule specialObjectNames name) fields |> String.join "\n\n")
    )


prepend : List String -> List String -> List Type.Field -> String
prepend apiSubmodule moduleName fields =
    interpolate """module {0} exposing (..)

import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Builder.Object as Object
import Graphqelm.SelectionSet exposing (SelectionSet)
import Graphqelm.OptionalArgument exposing (OptionalArgument(Absent))
import {2}.Object
import Json.Decode as Decode
import Graphqelm.Encode as Encode exposing (Value)
{1}


selection : (a -> constructor) -> SelectionSet (a -> constructor) {0}
selection constructor =
    Object.object constructor
"""
        [ moduleName |> String.join "."
        , Imports.importsString apiSubmodule moduleName fields
        , apiSubmodule |> String.join "."
        ]
