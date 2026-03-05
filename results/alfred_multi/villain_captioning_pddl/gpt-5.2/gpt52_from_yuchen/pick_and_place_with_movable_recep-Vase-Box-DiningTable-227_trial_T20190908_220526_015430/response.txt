(define (problem put_task_box_plate_on_table)
  (:domain put_task)

  (:objects
    robot - agent

    table1 - receptacle

    box1 - object
    plate1 - object
    keys1 - object
    paper1 - object
    trophy1 - object
  )

  (:init
    ;; robot starts not at any object's location (so no atLocation facts for robot)

    ;; objects on the table
    (inReceptacle plate1 table1)
    (inReceptacle keys1 table1)
    (inReceptacle paper1 table1)
    (inReceptacle trophy1 table1)
  )

  (:goal
    (and
      ;; "a box with a plate on a table" -> interpret as: plate is in the box, and box is on/in the table
      (inReceptacle plate1 box1)
      (inReceptacle box1 table1)
    )
  )
)