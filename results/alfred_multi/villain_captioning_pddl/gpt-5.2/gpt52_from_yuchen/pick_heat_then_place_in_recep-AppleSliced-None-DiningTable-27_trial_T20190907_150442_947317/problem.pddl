(define (problem warm_apple_scene1)
  (:domain put_task)
  (:objects
    robot - agent

    microwave1 - microwave
    table1 - receptacle

    apple1 - object
    apple2 - object
    apple3 - object
    apple4 - object
    apple5 - object

    bread1 - object
    tomato1 - object
    spoon1 - object

    pepper1 - object
    pepper2 - object
    pepper3 - object

    pan1 - object
  )

  (:init
    ;; robot initial state
    (not (holdsAny robot))

    ;; receptacle structure / placements
    (inReceptacle pan1 table1)
    (inReceptacle bread1 table1)
    (inReceptacle spoon1 table1)
    (inReceptacle tomato1 table1)
    (inReceptacle apple1 table1)
    (inReceptacle apple2 table1)
    (inReceptacle apple3 table1)
    (inReceptacle apple4 table1)
    (inReceptacle apple5 table1)
    (inReceptacle pepper1 table1)
    (inReceptacle pepper2 table1)
    (inReceptacle pepper3 table1)

    ;; microwave is present; no open/close state assumed from image
    (openable microwave1)
  )

  (:goal
    (and
      (isHot apple1)
    )
  )
)