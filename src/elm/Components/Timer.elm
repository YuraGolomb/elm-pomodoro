module Components.Timer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Models exposing (Model, UTime)


timeToString : Int -> String
timeToString val =
    let
        str =
            if val > 9 then
                toString val
            else
                "0" ++ toString val
    in
    str


formatTime : UTime -> String
formatTime time =
    timeToString time.hours ++ " : " ++ timeToString time.minutes ++ " : " ++ timeToString time.seconds


timer : Model -> Html a
timer model =
    div
        [ class "h1" ]
        [ text (formatTime model.time) ]
