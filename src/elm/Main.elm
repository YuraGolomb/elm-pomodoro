module Main exposing (..)

-- component import example

import Components.Timer exposing (timer)
import Components.TimerConfig exposing (timerConfig)
import Components.TimerControl exposing (timerControl)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Messages exposing (..)
import Models exposing (..)
import Subscriptions exposing (subscriptions)
import Task exposing (..)
import Updates exposing (handleControlEvent, setTimerOptions, updateTime)


-- APP


main : Program Never Model Msg
main =
    Html.program { init = init, view = view, update = update, subscriptions = subscriptions }



-- MODEL


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


send : msg -> Cmd msg
send msg =
    Task.succeed msg
        |> Task.perform identity



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Tick time ->
            let
                msg =
                    if model.time.hours == 0 && model.time.minutes == 0 && model.time.seconds == 0 && model.isPaused == False then
                        --Cmd.none
                        send (ControlEvent Next)
                    else
                        Cmd.none
            in
            ( { model | time = updateTime model.time model.isPaused }, msg )

        SetTimerOptions subMsg ->
            ( { model | options = setTimerOptions subMsg model.options }, Cmd.none )

        ControlEvent subMsg ->
            ( handleControlEvent model subMsg, Cmd.none )



--SetTimerUpdate subMsg ->
--    ( { model | timerUpdate = setTimerUpdates subMsg model.timerUpdate }, Cmd.none )
--SetTimer ->
--    ( { model | time = model.timerUpdate }, Cmd.none )
-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib


getStatus : Status -> String
getStatus status =
    let
        statusStr =
            if status == Work then
                "Work"
            else
                "Break"
    in
    statusStr


view : Model -> Html Msg
view model =
    div [ class "container", style [ ( "margin-top", "30px" ), ( "text-align", "center" ) ] ]
        [ -- inline CSS (literal)
          div [ class "row" ]
            [ div [ class "col-xs-12" ]
                [ div [ class "jumbotron" ]
                    [ img [ src "static/img/elm.jpg", style styles.img ] [] -- inline CSS (via var)
                    , div [ class "stats-container" ]
                        [ div [ class "stats" ] [ div [] [ text "Status : " ], div [] [ text (getStatus model.status) ] ]
                        , div [ class "stats" ] [ div [] [ text "Rounds Left : " ], div [] [ text (toString model.roundsLeft) ] ]
                        ]
                    , timer model
                    , timerControl
                    , timerConfig model.options -- ext 'hello' component (takes 'model' as arg)
                    , p []
                        [ text "Elm Webpack Starter" ]
                    ]
                ]
            ]
        ]



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
