module Messages exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (UTime)
import Time exposing (..)


type Msg
    = NoOp
    | Tick Time
    | SetTimerOptions SetTimerOptions
    | ControlEvent ControlEvent


type SetTimerOptions
    = SetRoundTime SetTime
    | SetBreakTime SetTime
    | SetBigBreakTime SetTime
    | SetCountOfRounds String
    | SetRoundsToBigBreak String


type SetTime
    = SetHours String
    | SetMinutes String
    | SetSeconds String


type ControlEvent
    = Start
    | Skip
    | Pause
    | Stop
    | Continue
    | Next
