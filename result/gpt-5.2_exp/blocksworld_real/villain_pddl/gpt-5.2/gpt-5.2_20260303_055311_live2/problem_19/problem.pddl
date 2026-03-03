(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    yellow - block
    green - block
    blue - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; All blocks are on the table and clear (no stacks initially visible)
    (ontable red)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable purple)

    (clear red)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: blue over orange (interpreting the red block as the orange-colored block in the image)
      (on blue red)

      ;; Stack 2: yellow over green over red over purple
      (on yellow green)
      (on green red)
      (on red purple)
    )
  )
)