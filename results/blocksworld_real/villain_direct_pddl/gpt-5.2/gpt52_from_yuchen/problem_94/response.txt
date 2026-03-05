(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; stacks observed in the image
    (on yellow red)
    (ontable red)
    (clear yellow)

    (on purple blue)
    (ontable blue)
    (clear purple)

    ;; single blocks on the table
    (ontable green)
    (clear green)

    (ontable orange)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
      (on orange green)
      (ontable green)
      (clear purple)
    )
  )
)