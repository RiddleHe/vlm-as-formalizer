(define (problem blocks-stacks-1)
  (:domain blocksworld)
  (:objects
    yellow blue purple red green orange - block
    robot1 - robot
  )
  (:init
    ;; left stack
    (ontable yellow)
    (on blue yellow)
    (on purple blue)
    (clear purple)

    ;; right stack
    (ontable green)
    (on red green)
    (on orange red)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (ontable orange)
      (on green orange)
      (on red green)
      (on purple red)
      (on blue purple)
      (on yellow blue)
    )
  )
)