(define (problem blocksworld_color_stacks)
  (:domain blocksworld)
  (:objects
    orange - block
    yellow - block
    blue - block
    red - block
    purple - block
    green - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable orange)
    (ontable yellow)
    (ontable blue)
    (ontable red)
    (ontable purple)
    (ontable green)

    (clear orange)
    (clear yellow)
    (clear blue)
    (clear red)
    (clear purple)
    (clear green)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on blue red)
      (on purple green)
    )
  )
)