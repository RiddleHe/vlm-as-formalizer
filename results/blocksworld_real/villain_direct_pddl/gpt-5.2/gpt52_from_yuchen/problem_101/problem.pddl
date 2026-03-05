(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange yellow green red blue purple - block
    robot1 - robot
  )
  (:init
    ;; stacks visible in the image
    (on orange red)
    (on yellow purple)
    (on green blue)

    ;; bottom blocks are on the table
    (ontable red)
    (ontable purple)
    (ontable blue)

    ;; clear blocks (tops of stacks)
    (clear orange)
    (clear yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on red green)
      (on blue purple)
    )
  )
)