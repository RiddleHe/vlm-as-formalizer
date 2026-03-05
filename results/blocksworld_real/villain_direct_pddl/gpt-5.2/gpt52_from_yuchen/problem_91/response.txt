(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green yellow orange purple red - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block positions from the scene
    (on green blue)
    (ontable blue)
    (ontable purple)
    (on yellow orange)
    (ontable orange)
    (ontable red)

    ;; Clear conditions
    (clear green)
    (clear purple)
    (clear yellow)
    (clear red)
  )
  (:goal
    (and
      (on orange purple)
      (on purple red)
      (on red yellow)
      (on yellow green)
      (on green blue)
      (ontable blue)
    )
  )
)