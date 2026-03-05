(define (problem inspect_book_with_light)
  (:domain put_task)

  (:objects
    robot - agent

    nightstand - receptacle

    book - object
    lamp - object
    laptop - object
    pillow1 pillow2 - object
    keychain - object
    smallitem1 smallitem2 - object
  )

  (:init
    ;; Robot starts not at any object's location (no atLocation facts for robot).

    ;; Receptacle properties
    ;; Nightstand is a receptacle (surface). No evidence it is openable.
    (inReceptacle lamp nightstand)
    (inReceptacle keychain nightstand)
    (inReceptacle smallitem1 nightstand)
    (inReceptacle smallitem2 nightstand)

    ;; Lamp appears off initially, so we omit (isOn lamp).
  )

  (:goal
    (and
      ;; "with a light": ensure lamp is turned on (toggled on)
      (isOn lamp)
      ;; "inspect a book from the bed": model as robot reaching/being at the book location
      (atLocation robot book)
    )
  )
)