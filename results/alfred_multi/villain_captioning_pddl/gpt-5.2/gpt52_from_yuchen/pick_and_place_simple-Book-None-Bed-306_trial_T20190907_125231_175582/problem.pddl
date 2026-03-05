(define (problem move_book_desk_to_bed)
  (:domain put_task)

  (:objects
    robot - agent

    bed - receptacle
    desk - receptacle

    book - object
    laptop - object
  )

  (:init
    ;; receptacles
    ;; desk and bed are treated as receptacles that can hold objects

    ;; initial placements
    (inReceptacle book desk)
    (inReceptacle laptop desk)

    ;; robot initial state: not holding anything and not at any object's location
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle book bed)
    )
  )
)