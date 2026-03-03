(define (problem blocksworld_stacks_3)
  (:domain blocksworld)
  (:objects
    yellow - block
    purple - block
    green - block
    red - block
    blue - block
    orange - block
    robot1 - robot
  )
  (:init
    ;; initial stack (bottom to top) observed in the image:
    (ontable orange)
    (on blue orange)
    (on red blue)
    (on green red)
    (on purple green)
    (on yellow purple)

    ;; clear/hand state
    (clear yellow)
    (handempty robot1)
  )
  (:goal
    (and
      (on orange red)
      (on yellow blue)
      (on purple green)
    )
  )
)