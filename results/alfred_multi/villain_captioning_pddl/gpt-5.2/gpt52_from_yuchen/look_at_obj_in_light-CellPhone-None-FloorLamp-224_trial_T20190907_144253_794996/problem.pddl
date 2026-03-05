(define (problem put_task_cellphone_lamp)
  (:domain put_task)

  (:objects
    robot - agent
    tall_lamp1 - object
    cellphone1 - object
    cabinet1 - receptacle
    cabinet2 - receptacle
    trashcan1 - receptacle
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts for robot)

    ;; Scene objects exist; only assert locations we can ground from the instruction.
    ;; Cell phone is described as next to the tall lamp's light, so model it as co-located
    ;; with the lamp for interaction purposes.
    (atLocation robot tall_lamp1)
    (atLocation robot cellphone1)

    ;; No evidence any receptacle is openable/opened in the images, so omit openable/opened.
    ;; No evidence of any containment relationships, so omit inReceptacle.
    ;; Robot initially holds nothing, so omit holds/holdsAny.
  )

  (:goal
    (and
      ;; "Examine" is not a domain predicate; represent completion as having toggled the phone
      ;; (i.e., interacted with it) while at its location.
      (isToggled cellphone1)
    )
  )
)