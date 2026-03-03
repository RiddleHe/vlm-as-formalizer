(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    purple yellow orange red blue green - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block positions from the image
    (ontable green)
    (ontable yellow)
    (ontable red)
    (ontable purple)
    (ontable blue)
    (on orange blue)

    ;; Clear conditions
    (clear green)
    (clear yellow)
    (clear red)
    (clear purple)
    (clear orange)
  )
  (:goal
    (and
      (on purple yellow)
      (on yellow orange)
      (on orange red)
      (on red blue)
      (on blue green)
    )
  )
)