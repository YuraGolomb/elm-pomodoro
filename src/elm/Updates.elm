module Updates exposing (handleControlEvent, setTimerOptions, updateTime)

import Messages exposing (..)
import Models exposing (..)
import Updates.TimeUpdates exposing (setValueToUTime, updateHours, updateMinutes, updateSeconds)


--setTimerUpdates : SetTimerUpdate -> UTime -> UTime
--setTimerUpdates msg timerUpdate =
--    case msg of
--        SetSeconds seconds ->
--            { timerUpdate | seconds = String.toInt seconds |> Result.toMaybe |> Maybe.withDefault 0 }
--        SetMinutes minutes ->
--            { timerUpdate | minutes = String.toInt minutes |> Result.toMaybe |> Maybe.withDefault 0 }
--        SetHours hours ->
--            { timerUpdate | hours = String.toInt hours |> Result.toMaybe |> Maybe.withDefault 0 }


updateTime : UTime -> Bool -> UTime
updateTime oldTime isPaused =
    let
        newTime =
            { oldTime
                | hours =
                    if isPaused == True then
                        oldTime.hours
                    else
                        updateHours oldTime
                , minutes =
                    if isPaused == True then
                        oldTime.minutes
                    else
                        updateMinutes oldTime
                , seconds =
                    if isPaused == True then
                        oldTime.seconds
                    else
                        updateSeconds oldTime
            }
    in
    newTime


setTimerOptions : SetTimerOptions -> TimerOptions -> TimerOptions
setTimerOptions msg options =
    case msg of
        SetRoundTime fieldTypeMsg ->
            { options | round = setValueToUTime options.round fieldTypeMsg }

        SetBreakTime fieldTypeMsg ->
            { options | break = setValueToUTime options.break fieldTypeMsg }

        SetBigBreakTime fieldTypeMsg ->
            { options | bigBreak = setValueToUTime options.bigBreak fieldTypeMsg }

        SetCountOfRounds count ->
            { options | totalRounds = String.toInt count |> Result.toMaybe |> Maybe.withDefault 0 }

        SetRoundsToBigBreak count ->
            { options | roundsToBigBreak = String.toInt count |> Result.toMaybe |> Maybe.withDefault 0 }


handleControlEvent : Model -> ControlEvent -> Model
handleControlEvent model e =
    case e of
        Start ->
            { model
                | isPaused = False
                , status = Work
                , time = model.options.round
                , roundsLeft = model.options.roundsToBigBreak
            }

        Skip ->
            { model
                | isPaused = False
                , status =
                    if model.status == Work then
                        Break
                    else
                        Work
                , roundsLeft =
                    if model.status == Work then
                        model.roundsLeft - 1
                    else
                        model.roundsLeft
                , time =
                    if model.status == Work then
                        if model.roundsLeft == 1 then
                            model.options.bigBreak
                        else
                            model.options.break
                    else
                        model.options.round
            }

        Pause ->
            { model
                | isPaused = True
            }

        Continue ->
            { model
                | isPaused = False
            }

        Next ->
            { model
                | isPaused = True
                , status =
                    if model.status == Work then
                        Break
                    else
                        Work
                , roundsLeft =
                    if model.status == Work then
                        model.roundsLeft - 1
                    else
                        model.roundsLeft
                , time =
                    if model.status == Work then
                        if model.roundsLeft == 1 then
                            model.options.bigBreak
                        else
                            model.options.break
                    else
                        model.options.round
            }

        Stop ->
            { model
                | isPaused = True
                , status = Work
                , time = model.options.round
                , roundsLeft = model.options.roundsToBigBreak
            }
