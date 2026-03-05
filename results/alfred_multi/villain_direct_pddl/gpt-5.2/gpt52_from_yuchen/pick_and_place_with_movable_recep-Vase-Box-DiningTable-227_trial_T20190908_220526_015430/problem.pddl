(define (problem put_task_box_plate_on_table)
  (:domain put_task)

  (:objects
    robot - agent
    box1 - receptacle
    plate1 - object
    table1 - receptacle
  )

  (:init
    ;; receptacle properties
    ;; (openable box1) ; not specified/required from the scene

    ;; object locations
    (inReceptacle plate1 box1)

    ;; table is a receptacle (can hold objects)
    ;; no initial contents specified for table1

    ;; robot starts holding nothing and is not initially at any object's location
    ;; (holdsAny robot) is false by absence
  )

  (:goal
    (and
      (inReceptacle plate1 box1)
      (inReceptacle box1 table1)
    )
  )
)