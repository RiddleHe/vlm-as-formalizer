(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow green purple red blue orange - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current stacks from the image
    (on yellow orange)
    (ontable orange)

    (on red green)
    (on green purple)
    (ontable purple)

    (ontable blue)

    ;; clear blocks
    (clear yellow)
    (clear red)
    (clear blue)
  )
  (:goal
    (and
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue orange)
      (ontable orange)
    )
  )
)