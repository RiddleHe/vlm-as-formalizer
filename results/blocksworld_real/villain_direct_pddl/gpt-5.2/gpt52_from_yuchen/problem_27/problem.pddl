(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    orange green blue yellow red purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions from the image
    (ontable orange)
    (ontable green)
    (ontable purple)
    (ontable red)
    (ontable blue)
    (on yellow blue)

    ;; clear blocks
    (clear orange)
    (clear green)
    (clear purple)
    (clear red)
    (clear yellow)
  )
  (:goal
    (and
      (on blue green)
      (on green red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)