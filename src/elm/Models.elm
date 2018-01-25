module Models exposing (..)

--import Time exposing (Time)


type alias UTime =
    { seconds : Int
    , minutes : Int
    , hours : Int
    }


type alias Model =
    { time : UTime
    , isPaused : Bool
    , roundsLeft : Int
    , status : Status
    , options : TimerOptions
    }


type alias TimerOptions =
    { round : UTime
    , break : UTime
    , bigBreak : UTime
    , roundsToBigBreak : Int
    , totalRounds : Int
    }


type Status
    = Work
    | Break


initialModel : Model
initialModel =
    { status = Work
    , roundsLeft = 4
    , isPaused = True
    , time =
        { seconds = 0
        , minutes = 0
        , hours = 0
        }
    , options =
        { totalRounds = 6
        , roundsToBigBreak = 4
        , round =
            { seconds = 0
            , minutes = 20
            , hours = 0
            }
        , break =
            { seconds = 0
            , minutes = 5
            , hours = 0
            }
        , bigBreak =
            { seconds = 0
            , minutes = 25
            , hours = 0
            }
        }
    }
