(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange red purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; robot initial state
    (handempty robot1)

    ;; blocks in the scene
    ;; observed stack: blue on purple
    (on blue purple)

    ;; table placements
    (ontable purple)
    (ontable orange)
    (ontable red)
    (ontable green)
    (ontable yellow)

    ;; clear conditions
    (clear blue)
    (clear orange)
    (clear red)
    (clear green)
    (clear yellow)
  )
  (:goal
    (and
      (on blue orange)
      (on orange red)
      (on red purple)
      (on purple green)
      (on green yellow)
      (ontable yellow)
    )
  )
)