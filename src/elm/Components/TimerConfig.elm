module Components.TimerConfig exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Messages exposing (..)
import Models exposing (Model, TimerOptions)


timerConfig : TimerOptions -> Html Msg
timerConfig options =
    div
        [ class "timer-config" ]
        [ div [ class "config-row" ]
            [ text "Rounds To BigBreak : "
            , input
                [ type_ "number"
                , value <| toString <| options.roundsToBigBreak
                , class "time-input"
                , onInput (SetTimerOptions << SetRoundsToBigBreak)
                ]
                []
            ]
        , div [ class "config-row" ]
            [ text "Total Rounds : "
            , input
                [ type_ "number"
                , value <| toString <| options.totalRounds
                , class "time-input"
                , onInput (SetTimerOptions << SetCountOfRounds)
                ]
                []
            ]
        , div [ class "config-row" ]
            [ span [ class "config-title" ]
                [ text "Round Time : " ]
            , div
                [ class "time-container" ]
                [ div [ class "time-val" ]
                    [ text "Hours : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.round.hours
                        , class "time-input"
                        , onInput (SetTimerOptions << SetRoundTime << SetHours)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Minutes : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.round.minutes
                        , class "time-input"
                        , onInput (SetTimerOptions << SetRoundTime << SetMinutes)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Seconds : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.round.seconds
                        , class "time-input"
                        , onInput (SetTimerOptions << SetRoundTime << SetSeconds)
                        ]
                        []
                    ]
                ]
            ]
        , div [ class "config-row" ]
            [ span [ class "config-title" ]
                [ text "Break Time : " ]
            , div
                [ class "time-container" ]
                [ div [ class "time-val" ]
                    [ text "Hours : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.break.hours
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBreakTime << SetHours)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Minutes : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.break.minutes
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBreakTime << SetMinutes)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Seconds : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.break.seconds
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBreakTime << SetSeconds)
                        ]
                        []
                    ]
                ]
            ]
        , div [ class "config-row" ]
            [ span [ class "config-title" ]
                [ text "Big Break Time : " ]
            , div
                [ class "time-container" ]
                [ div [ class "time-val" ]
                    [ text "Hours : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.bigBreak.hours
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBigBreakTime << SetHours)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Minutes : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.bigBreak.minutes
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBigBreakTime << SetMinutes)
                        ]
                        []
                    ]
                , div [ class "time-val" ]
                    [ text "Seconds : "
                    , input
                        [ type_ "number"
                        , value <| toString <| options.bigBreak.seconds
                        , class "time-input"
                        , onInput (SetTimerOptions << SetBigBreakTime << SetSeconds)
                        ]
                        []
                    ]
                ]
            ]
        ]



--[ input [ type_ "number", value <| <| toString <| <| time.seconds, onInput (SetTimerUpdate << SetSeconds) ] []
--, input [ type_ "number", value <| <| toString <| <| time.minutes, onInput (SetTimerUpdate << SetMinutes) ] []
--, input [ type_ "number", value <| <| toString <| <| time.hours, onInput (SetTimerUpdate << SetHours) ] []
--, button [ onClick SetTimer ] [ text "Set" ]
--]
