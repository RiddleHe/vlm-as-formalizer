(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange green purple yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Current block configuration from the image:
    ;; A stack: red on blue on orange (with orange on table)
    (on red blue)
    (on blue orange)
    (ontable orange)
    (clear red)

    ;; Single blocks on the table
    (ontable purple)
    (clear purple)

    (ontable yellow)
    (clear yellow)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      ;; Goal stack (top to bottom):
      (on orange red)
      (on red green)
      (on green blue)
      (on blue purple)
      (on purple yellow)
      (ontable yellow)
      (clear orange)
    )
  )
)