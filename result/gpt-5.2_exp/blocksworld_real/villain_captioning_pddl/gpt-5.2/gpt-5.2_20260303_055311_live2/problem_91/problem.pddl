(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue green yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; stack already present
    (on green blue)
    (ontable blue)
    (clear green)

    ;; other blocks on table
    (ontable yellow)
    (clear yellow)
    (ontable red)
    (clear red)
    (ontable purple)
    (clear purple)
    (ontable orange)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green blue)
      (on yellow green)
      (on red yellow)
      (on purple red)
      (on orange purple)
    )
  )
)