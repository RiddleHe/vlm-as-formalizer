(define (problem put_books_on_desk)
  (:domain put_task)
  (:objects
    robot - agent

    desk1 - receptacle

    book1 book2 - object
    laptop1 - object
    phone1 phone2 - object
    cup1 cup2 - object
    plush1 - object
  )

  (:init
    ;; Robot initially not at any object's location and holds nothing
    (not (holdsAny robot))

    ;; Desk is a receptacle (surface) that can hold objects
    ;; (No openable/opened predicates apply in this scene)

    ;; Objects currently on the bed (modeled as being in the same receptacle/location context)
    ;; Since 'bed' is not an available receptacle type in the domain, we represent these
    ;; objects as not initially in the desk and not initially at the desk location.
    ;; The robot must go to each object directly to pick it up.
    (not (inReceptacle book1 desk1))
    (not (inReceptacle book2 desk1))
    (not (inReceptacle laptop1 desk1))
    (not (inReceptacle plush1 desk1))

    ;; Objects already on the desk
    (inReceptacle phone1 desk1)
    (inReceptacle phone2 desk1)
    (inReceptacle cup1 desk1)
    (inReceptacle cup2 desk1)
  )

  (:goal
    (and
      (inReceptacle book1 desk1)
      (inReceptacle book2 desk1)
    )
  )
)