(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue orange yellow red purple - block
    robot1 - robot
  )
  (:init
    ;; existing stack
    (on purple red)
    (on red yellow)
    (ontable yellow)

    ;; loose blocks on table
    (ontable green)
    (ontable blue)
    (ontable orange)

    ;; clear blocks
    (clear purple)
    (clear green)
    (clear blue)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow green)
      (ontable green)
    )
  )
)