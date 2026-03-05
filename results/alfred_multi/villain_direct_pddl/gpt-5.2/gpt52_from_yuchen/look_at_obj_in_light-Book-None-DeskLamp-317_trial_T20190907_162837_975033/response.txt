(define (problem inspect_book_with_light)
  (:domain put_task)
  (:objects
    robot - agent

    bed - receptacle
    nightstand - receptacle

    book - object
    lamp - object
    laptop - object
    pillow1 - object
    pillow2 - object
  )

  (:init
    ;; receptacles in the scene
    (inReceptacle book bed)
    (inReceptacle laptop bed)
    (inReceptacle pillow1 bed)
    (inReceptacle pillow2 bed)
    (inReceptacle lamp nightstand)

    ;; robot initially not at any object's location (per instruction)
    ;; no (atLocation robot ...) facts

    ;; lamp initially assumed off (no isOn fact)
  )

  (:goal
    (and
      ;; "inspect ... with a light" modeled as turning on/toggling the lamp,
      ;; while being at the book's location (bed)
      (isToggled lamp)
      (isOn lamp)
      (atLocation robot bed)
    )
  )
)