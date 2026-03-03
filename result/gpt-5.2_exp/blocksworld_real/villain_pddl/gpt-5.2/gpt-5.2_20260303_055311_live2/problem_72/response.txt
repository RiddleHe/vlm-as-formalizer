(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange - block
    purple - block
    green - block
    blue - block
    red - block
    yellow - block
    robot1 - robot
  )
  (:init
    ;; All blocks are on the table and clear (no stacks in the scene)
    (ontable orange)
    (ontable purple)
    (ontable green)
    (ontable blue)
    (ontable red)
    (ontable yellow)

    (clear orange)
    (clear purple)
    (clear green)
    (clear blue)
    (clear red)
    (clear yellow)

    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue red)
      (on red yellow)
      (ontable yellow)
    )
  )
)