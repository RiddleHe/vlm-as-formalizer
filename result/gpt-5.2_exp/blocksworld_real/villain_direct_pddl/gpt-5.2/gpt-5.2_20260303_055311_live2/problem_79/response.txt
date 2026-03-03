(define (problem blocks_scene_stacks3)
  (:domain blocksworld)
  (:objects
    blue orange red green purple yellow - block
    robot1 - robot
  )
  (:init
    ;; assume a robot arm is available and starts empty
    (handempty robot1)

    ;; stacks/placements observed in the scene
    (on green red)
    (on red orange)
    (ontable orange)

    ;; other blocks on the table
    (ontable blue)
    (ontable purple)
    (ontable yellow)

    ;; clear blocks (no block on top)
    (clear green)
    (clear blue)
    (clear purple)
    (clear yellow)
  )
  (:goal
    (and
      (on blue orange)
      (on purple green)
      (on yellow red)
    )
  )
)