(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; Stack: purple on red on yellow (all on table)
    (on purple red)
    (on red yellow)
    (ontable yellow)

    ;; Other blocks on table
    (ontable green)
    (ontable blue)
    (ontable orange)

    ;; Clear conditions
    (clear purple)
    (clear green)
    (clear blue)
    (clear orange)
  )
  (:goal
    (and
      (ontable green)
      (on yellow green)
      (on blue yellow)
      (on red blue)
      (on purple red)
      (on orange purple)
    )
  )
)