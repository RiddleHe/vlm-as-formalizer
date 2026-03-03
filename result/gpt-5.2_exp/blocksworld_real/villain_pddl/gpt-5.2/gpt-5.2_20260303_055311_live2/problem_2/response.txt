(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange blue purple red green yellow - block
    robot1 - robot
  )
  (:init
    ;; left stack in the scene: orange on blue on purple on red (all stacked)
    (on orange blue)
    (on blue purple)
    (on purple red)
    (ontable red)
    (clear orange)

    ;; right small stack in the scene: green on yellow
    (on green yellow)
    (ontable yellow)
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green red)
      (on red purple)
      (on purple blue)
      (on blue orange)
      (on orange yellow)
    )
  )
)