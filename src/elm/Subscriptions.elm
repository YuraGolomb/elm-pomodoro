module Subscriptions exposing (..)

import Messages exposing (..)
import Models exposing (Model)
import Time exposing (Time, second)


subscriptions : Model -> Sub Msg
subscriptions model =
    Time.every second Tick
