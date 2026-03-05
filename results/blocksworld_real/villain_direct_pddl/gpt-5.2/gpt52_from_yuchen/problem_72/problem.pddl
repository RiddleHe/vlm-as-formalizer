(define (problem blocksworld_color_stack)
  (:domain blocksworld)
  (:objects
    purple - block
    orange - block
    blue - block
    yellow - block
    green - block
    red - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table in the scene (no stacks)
    (ontable purple)
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable green)
    (ontable red)

    (clear purple)
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear green)
    (clear red)

    (handempty robot1)
  )
  (:goal
    (and
      (on red yellow)
      (on blue red)
      (on green blue)
      (on purple green)
      (on orange purple)
    )
  )
)