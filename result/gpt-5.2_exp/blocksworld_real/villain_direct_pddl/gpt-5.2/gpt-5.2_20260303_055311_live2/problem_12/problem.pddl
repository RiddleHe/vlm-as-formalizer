(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple green yellow blue orange red - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene (top to bottom): purple on green on yellow on blue on orange on red
    (on purple green)
    (on green yellow)
    (on yellow blue)
    (on blue orange)
    (on orange red)
    (ontable red)

    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on purple green)
      (on red blue)
    )
  )
)