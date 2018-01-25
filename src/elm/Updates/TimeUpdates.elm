module Updates.TimeUpdates exposing (setValueToUTime, updateHours, updateMinutes, updateSeconds)

import Messages exposing (..)
import Models exposing (..)


updateSeconds : UTime -> Int
updateSeconds oldTime =
    let
        newSeconds =
            if
                oldTime.seconds
                    == 0
                    && oldTime.minutes
                    == 0
                    && oldTime.hours
                    == 0
            then
                0
            else if oldTime.seconds == 0 then
                59
            else
                oldTime.seconds - 1
    in
    newSeconds


updateMinutes : UTime -> Int
updateMinutes oldTime =
    let
        newMinutes =
            if
                oldTime.seconds
                    == 0
                    && oldTime.minutes
                    == 0
                    && oldTime.hours
                    == 0
            then
                0
            else if oldTime.seconds == 0 && oldTime.minutes == 0 then
                59
            else if oldTime.seconds == 0 then
                oldTime.minutes - 1
            else
                oldTime.minutes
    in
    newMinutes


updateHours : UTime -> Int
updateHours oldTime =
    let
        newHours =
            if
                oldTime.seconds
                    == 0
                    && oldTime.minutes
                    == 0
                    && oldTime.hours
                    == 0
            then
                0
            else if oldTime.seconds == 0 && oldTime.minutes == 0 then
                oldTime.hours - 1
            else
                oldTime.hours
    in
    newHours


setValueToUTime : UTime -> SetTime -> UTime
setValueToUTime time msg =
    case msg of
        SetHours value ->
            { time | hours = String.toInt value |> Result.toMaybe |> Maybe.withDefault 0 }

        SetMinutes value ->
            { time | minutes = String.toInt value |> Result.toMaybe |> Maybe.withDefault 0 }

        SetSeconds value ->
            { time | seconds = String.toInt value |> Result.toMaybe |> Maybe.withDefault 0 }
