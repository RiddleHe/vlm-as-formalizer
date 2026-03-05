(define (problem put_phone_on_bed)
  (:domain put_task)
  (:objects
    robot - agent
    bed - receptacle
    desk - receptacle
    phone - object
    pen - object
    lamp - object
    bluecard - object
    trashcan - object
  )

  (:init
    ;; Robot starts not at any object's location and holds nothing.

    ;; Receptacle relations (objects on/in receptacles)
    (inReceptacle phone desk)
    (inReceptacle pen desk)
    (inReceptacle lamp desk)
    (inReceptacle bluecard desk)
    (inReceptacle trashcan desk)

    ;; No openable/opened facts: bed/desk are treated as surfaces (not openable).
  )

  (:goal
    (and
      (inReceptacle phone bed)
    )
  )
)