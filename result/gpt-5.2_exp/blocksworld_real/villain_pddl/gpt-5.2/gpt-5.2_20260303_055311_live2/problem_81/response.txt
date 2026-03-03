(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; From the image: a single stack (bottom to top): red, green, blue, purple, yellow
    (ontable red)
    (on green red)
    (on blue green)
    (on purple blue)
    (on yellow purple)

    ;; Orange block is separate on the table
    (ontable orange)

    ;; Clear blocks
    (clear yellow)
    (clear orange)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Create 3 stacks as instructed:
      (on green red)
      (on purple yellow)
      (on blue orange)
    )
  )
)