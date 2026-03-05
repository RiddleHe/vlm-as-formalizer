(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green orange yellow red blue purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left stack
    (ontable red)
    (on yellow red)
    (clear yellow)

    ;; right stack
    (ontable blue)
    (on purple blue)
    (clear purple)

    ;; single blocks
    (ontable green)
    (clear green)
    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
      (on orange green)
      (ontable green)
    )
  )
)