(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red purple yellow green orange blue - block
    robot1 - robot
  )
  (:init
    ;; Current scene: a single stack (top to bottom)
    (on orange yellow)
    (on yellow purple)
    (on purple green)
    (on green blue)
    (on blue red)
    (ontable red)

    (clear orange)

    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: red over purple
      (on red purple)

      ;; Stack 2: yellow over green over orange over blue
      (on yellow green)
      (on green orange)
      (on orange blue)
    )
  )
)