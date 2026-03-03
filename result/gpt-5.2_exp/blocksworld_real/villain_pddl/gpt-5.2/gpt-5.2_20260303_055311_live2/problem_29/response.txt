(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange green purple red yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; A stack: orange on green on red
    (on orange green)
    (on green red)
    (ontable red)
    (clear orange)

    ;; Other blocks on the table
    (ontable blue)
    (clear blue)

    (ontable yellow)
    (clear yellow)

    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      (on blue orange)
      (on orange green)
      (on green purple)
      (on purple red)
      (on red yellow)
      (ontable yellow)
      (clear blue)
    )
  )
)