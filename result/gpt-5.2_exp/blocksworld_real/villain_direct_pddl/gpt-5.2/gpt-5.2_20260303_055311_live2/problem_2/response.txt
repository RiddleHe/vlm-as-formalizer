(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    robot1 - robot
    orange - block
    blue - block
    purple - block
    red - block
    green - block
    yellow - block
  )
  (:init
    (handempty robot1)

    ;; Left stack in the scene (top to bottom): orange on blue on purple on red
    (on orange blue)
    (on blue purple)
    (on purple red)
    (ontable red)
    (clear orange)

    ;; Right stack in the scene (top to bottom): green on yellow
    (on green yellow)
    (ontable yellow)
    (clear green)
  )
  (:goal
    (and
      (on green red)
      (on red purple)
      (on purple blue)
      (on blue orange)
      (on orange yellow)
      (ontable yellow)
      (clear green)
    )
  )
)