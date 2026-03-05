(define (problem move_two_remotes_to_chair_seat)
  (:domain put_task)

  (:objects
    robot - agent

    chair_seat_1 - receptacle

    remote_1 - object
    remote_2 - object
    sofa_seat_1 - object
  )

  (:init
    ;; Robot starts not holding anything (and per instruction, not at any location)
    (not (holdsAny robot))

    ;; Scene placements (using inReceptacle to indicate an object resting on a surface/place)
    (inReceptacle remote_1 sofa_seat_1)

    ;; Second remote required by instruction is not clearly visible in the images;
    ;; we still include it as an object and place it on the sofa seat as well.
    (inReceptacle remote_2 sofa_seat_1)

    ;; No openable/opened facts (chair seat is not openable)
  )

  (:goal
    (and
      (inReceptacle remote_1 chair_seat_1)
      (inReceptacle remote_2 chair_seat_1)
    )
  )
)