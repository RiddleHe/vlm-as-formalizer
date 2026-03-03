(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    orange - block
    yellow - block
    green - block
    blue - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable red)
    (ontable orange)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable purple)

    (clear red)
    (clear orange)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on blue purple)
      (on green yellow)
      (on red orange)
    )
  )
)