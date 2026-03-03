(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange red purple blue green - block
    robot1 - robot
  )
  (:init
    ;; stacks visible in the scene
    (on purple orange)
    (on blue green)

    ;; blocks on table
    (ontable orange)
    (ontable green)
    (ontable yellow)
    (ontable red)

    ;; clear blocks (no block on top)
    (clear purple)
    (clear blue)
    (clear yellow)
    (clear red)

    ;; robot state
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