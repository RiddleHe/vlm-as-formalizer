(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current scene (from image)
    ;; Stack on the right: purple on red on yellow
    (on purple red)
    (on red yellow)
    (ontable yellow)
    (clear purple)

    ;; Other blocks are on the table and clear
    (ontable green)
    (clear green)

    (ontable blue)
    (clear blue)

    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow green)
      (ontable green)
      (clear orange)
    )
  )
)