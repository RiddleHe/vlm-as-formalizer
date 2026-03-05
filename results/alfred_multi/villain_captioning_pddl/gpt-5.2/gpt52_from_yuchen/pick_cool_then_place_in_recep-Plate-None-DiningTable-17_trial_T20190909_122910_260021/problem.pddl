(define (problem put_task_chilled_plate_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table - receptacle

    knife1 - knife
    bread1 fork1 fork2 shaker1 shaker2 apple1 lettuce1 greenblock1 plate1 - object
  )

  (:init
    ;; Robot initially not at any object's location and holding nothing
    (not (holdsAny robot))

    ;; Table can hold items (modeled as receptacle)
    ;; Objects currently on the table
    (inReceptacle knife1 table)
    (inReceptacle bread1 table)
    (inReceptacle fork1 table)
    (inReceptacle fork2 table)
    (inReceptacle shaker1 table)
    (inReceptacle shaker2 table)
    (inReceptacle apple1 table)
    (inReceptacle lettuce1 table)
    (inReceptacle greenblock1 table)

    ;; Plate is not visible in the scene; include it as an object but not placed anywhere.
    ;; It must be chilled already to satisfy "chilled plate" (no fridge is present to cool it).
    (isCool plate1)
  )

  (:goal
    (and
      (inReceptacle plate1 table)
      (isCool plate1)
    )
  )
)