(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    green purple blue yellow orange red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear in the scene
    (ontable green)
    (ontable purple)
    (ontable blue)
    (ontable yellow)
    (ontable orange)
    (ontable red)

    (clear green)
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear orange)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on blue purple)
      (on red orange)
      (on orange green)
    )
  )
)