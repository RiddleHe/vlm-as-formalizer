(define (problem blocksworld_color_stacks)
  (:domain blocksworld)
  (:objects
    orange red purple yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; Current tower in the image (top to bottom):
    (on orange red)
    (on red purple)
    (on purple yellow)
    (on yellow green)
    (on green blue)
    (ontable blue)

    (clear orange)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: red over green over purple
      (on red green)
      (on green purple)
      (ontable purple)

      ;; Stack 2: orange over blue over yellow
      (on orange blue)
      (on blue yellow)
      (ontable yellow)

      (clear red)
      (clear orange)
    )
  )
)