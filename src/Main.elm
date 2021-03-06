module Main exposing (Model, Msg(..), State(..), init, main, subscriptions, update, view)

import Browser
import Html exposing (Html, code, div, pre, text)
import Html.Attributes exposing (class, id)
import Http
import Json.Encode as Encode



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }



-- MODEL


type State
    = Success String
    | Loading
    | Error


type alias Model =
    { state : State
    , language : String
    }


type alias Flags =
    { language : String
    , url : String
    }


init : Flags -> ( Model, Cmd Msg )
init { language, url } =
    ( Model Loading language
    , Http.get
        { url = url
        , expect = Http.expectString GotText
        }
    )



-- UPDATE


type Msg
    = GotText (Result Http.Error String)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotText result ->
            case result of
                Ok fullText ->
                    ( { model | state = Success fullText }, Cmd.none )

                Err _ ->
                    ( { model | state = Error }, Cmd.none )



-- VIEW


createClass : String -> String
createClass str =
    "language-" ++ str


view : Model -> Html Msg
view { state, language } =
    case state of
        Error ->
            text "Could not retrieve your data"

        Loading ->
            text "Loading..."

        Success str ->
            pre
                []
                [ code
                    [ class <| createClass language ]
                    [ text str ]
                ]



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
