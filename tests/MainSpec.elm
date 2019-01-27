module MainSpec exposing (suite)

import Expect
import Http
import Main exposing (..)
import Test exposing (..)


suite : Test
suite =
    describe "Main.update"
        [ test "GotText Ok: State" <|
            \_ ->
                let
                    txt =
                        "Lorem ipsum"

                    msg =
                        GotText (Result.Ok txt)

                    ( model, _ ) =
                        update msg (Model Loading "text")
                in
                Expect.equal model.state (Success txt)
        , test "GotText Ok: Language" <|
            \_ ->
                let
                    lang =
                        "html"

                    msg =
                        GotText (Result.Ok "Lorem ipsum")

                    ( model, _ ) =
                        update msg (Model Loading lang)
                in
                Expect.equal model.language lang
        , test "GotText Err" <|
            \_ ->
                let
                    msg =
                        GotText (Result.Err Http.Timeout)

                    ( model, _ ) =
                        update msg (Model Loading "text")
                in
                Expect.equal model.state Error
        ]
