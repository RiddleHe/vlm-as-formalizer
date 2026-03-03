(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    orange - block
    green - block
    blue - block
    yellow - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table and clear (no stacks initially)
    (ontable red)
    (ontable orange)
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable purple)

    (clear red)
    (clear orange)
    (clear green)
    (clear blue)
    (clear yellow)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over orange over red
      (on orange red)
      (on green orange)

      ;; stack 2: blue over purple over yellow
      (on purple yellow)
      (on blue purple)
    )
  )
)