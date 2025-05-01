(define (problem slice-cucumber)
  (:domain cooking)
  (:objects
    robot1
    robot2
    cucumber1 - cucumber
    knife1 - tool
    bowl1 - bowl
    table - location
  )
  (:init
    (at cucumber1 table)
    (sliceable cucumber1)
    (clean bowl1)
    (at bowl1 table)
    (at knife1 table)
    (holding_knife robot1)
    (holding robot1 knife1)
  )
  (:goal
    (and
      (sliced cucumber1)
      (in cucumber1 bowl1)
    )
  )
)