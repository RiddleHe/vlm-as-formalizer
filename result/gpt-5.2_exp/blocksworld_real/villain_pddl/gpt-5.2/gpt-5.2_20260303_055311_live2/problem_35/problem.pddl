(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green - block
    yellow - block
    blue - block
    orange - block
    red - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks on table
    (ontable green)
    (ontable yellow)
    (ontable red)
    (ontable purple)

    ;; stack seen in the image: orange on blue
    (ontable blue)
    (on orange blue)

    ;; clear blocks
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