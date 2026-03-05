(define (problem put_books_on_desk)
  (:domain put_task)

  (:objects
    robot - agent
    desk - receptacle
    bed - receptacle
    book1 book2 - object
  )

  (:init
    ;; receptacles
    (inReceptacle book1 bed)
    (inReceptacle book2 bed)

    ;; robot starts with no location and holds nothing
    (not (holdsAny robot))
  )

  (:goal
    (and
      (inReceptacle book1 desk)
      (inReceptacle book2 desk)
    )
  )
)