(define (problem put_task_lamp_bat)
  (:domain put_task)
  (:objects
    agent1 - agent

    desk1 - receptacle
    nightstand1 - receptacle

    lamp1 - object
    bat1 - object
    keys1 - object
    mug1 - object
    book1 - object
    clock1 - object
    bag1 - object
  )

  (:init
    ;; receptacle relations (objects resting on furniture)
    (inReceptacle lamp1 desk1)
    (inReceptacle keys1 desk1)
    (inReceptacle mug1 desk1)

    (inReceptacle clock1 nightstand1)

    ;; other visible items (no specific receptacle asserted)
    ;; book1 is on the bed; bag1 is on the floor near the wall
    ;; bat1 is present in the scene

    ;; agent starts not at any location and holds nothing
  )

  (:goal
    (and
      (isOn lamp1)
    )
  )
)