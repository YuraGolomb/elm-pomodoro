module Components.TimerControl exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (Model, UTime)


--handleClick : a -> ControlEvent
--handleClick a =
--    Stop


timerControl : Html Msg
timerControl =
    div
        [ class "timer-control" ]
        [ button [ onClick (ControlEvent Start) ] [ text "Start" ]
        , button [ onClick (ControlEvent Stop) ] [ text "Stop" ]
        , button [ onClick (ControlEvent Pause) ] [ text "Pause" ]
        , button [ onClick (ControlEvent Continue) ] [ text "Continue" ]
        , button [ onClick (ControlEvent Skip) ] [ text "Skip" ]
        ]
