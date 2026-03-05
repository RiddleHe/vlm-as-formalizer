(define (problem chill_apple_put_on_white_table)
  (:domain put_task)

  (:objects
    robot - agent

    fridge1 - fridge

    apple1 - object
    white_table1 - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)
    ;; and is not holding anything
    (not (holdsAny robot))

    ;; fridge properties
    (openable fridge1)
    (not (opened fridge1))

    ;; scene placements / locations
    ;; apple is on the white table (modeled as being "in" the table object for location purposes)
    (inReceptacle apple1 white_table1)

    ;; apple is not initially cooled
    (not (isCool apple1))
  )

  (:goal
    (and
      (isCool apple1)
      ;; "put it down on the white table"
      (inReceptacle apple1 white_table1)
      (not (holdsAny robot))
    )
  )
)