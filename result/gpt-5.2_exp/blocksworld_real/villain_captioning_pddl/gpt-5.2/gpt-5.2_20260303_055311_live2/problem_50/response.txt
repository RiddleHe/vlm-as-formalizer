(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple red green orange yellow blue - block
    robot1 - robot
  )
  (:init
    ;; Left stack
    (on orange yellow)
    (on yellow blue)
    (ontable blue)
    (clear orange)

    ;; Right stack
    (on purple red)
    (on red green)
    (ontable green)
    (clear purple)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple blue)
      (on blue green)
      (on green red)
      (on red orange)
      (on orange yellow)
    )
  )
)