(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange yellow blue purple red - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Block positions from the image
    (ontable orange)
    (ontable blue)
    (ontable yellow)
    (ontable red)
    (on purple red)

    ;; Clear conditions
    (clear orange)
    (clear blue)
    (clear yellow)
    (clear purple)
    ;; red is not clear because purple is on it
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow blue)
      (on blue purple)
      (on purple red)
    )
  )
)