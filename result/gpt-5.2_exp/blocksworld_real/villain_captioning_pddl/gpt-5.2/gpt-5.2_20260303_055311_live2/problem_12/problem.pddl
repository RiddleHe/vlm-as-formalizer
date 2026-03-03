(define (problem blocksworld_scene_stacks3)
  (:domain blocksworld)
  (:objects
    purple green yellow blue orange red - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; stack configuration (bottom to top): red, orange, blue, yellow, green, purple
    (ontable red)
    (on orange red)
    (on blue orange)
    (on yellow blue)
    (on green yellow)
    (on purple green)

    ;; clear statuses
    (clear purple)
  )
  (:goal
    (and
      (on yellow orange)
      (on purple green)
      (on red blue)
    )
  )
)