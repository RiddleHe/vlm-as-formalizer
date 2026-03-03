(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow blue orange purple red green - block
    robot1 - robot
  )
  (:init
    ;; current stacks from the image:
    (on purple orange)
    (on blue green)

    ;; blocks on the table:
    (ontable orange)
    (ontable green)
    (ontable yellow)
    (ontable red)

    ;; clear blocks:
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear red)

    ;; robot state:
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow blue)
      (on orange purple)
      (on red green)
    )
  )
)