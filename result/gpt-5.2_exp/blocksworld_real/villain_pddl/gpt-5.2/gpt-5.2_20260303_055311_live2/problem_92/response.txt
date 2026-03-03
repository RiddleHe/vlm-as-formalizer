(define (problem blocksworld_two_stacks)
  (:domain blocksworld)
  (:objects
    orange red purple yellow green blue - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single vertical stack (top -> bottom):
    ;; orange on red on purple on yellow on green on blue (blue on table)
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
      ;; Stack 1: red over green over purple (purple on table)
      (on red green)
      (on green purple)
      (ontable purple)

      ;; Stack 2: orange over blue over yellow (yellow on table)
      (on orange blue)
      (on blue yellow)
      (ontable yellow)

      ;; tops are clear
      (clear red)
      (clear orange)
    )
  )
)