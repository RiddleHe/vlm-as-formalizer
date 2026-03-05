(define (problem put_task_bowl_pencil_nightstand)
  (:domain put_task)

  (:objects
    robot - agent

    bowl1 - receptacle
    nightstand1 - receptacle

    pencil1 pencil2 pencil3 pencil4 - object
    desk1 - object
  )

  (:init
    ;; Robot starts not at any object's location (so no atLocation facts for robot)

    ;; Object locations (modeled via inReceptacle relations)
    (inReceptacle bowl1 desk1)
    (inReceptacle pencil1 desk1)
    (inReceptacle pencil2 desk1)
    (inReceptacle pencil3 desk1)
    (inReceptacle pencil4 desk1)

    ;; No openable/opened receptacles are indicated in the scene
  )

  (:goal
    (and
      (inReceptacle bowl1 nightstand1)
      (or
        (inReceptacle pencil1 bowl1)
        (inReceptacle pencil2 bowl1)
        (inReceptacle pencil3 bowl1)
        (inReceptacle pencil4 bowl1)
      )
    )
  )
)