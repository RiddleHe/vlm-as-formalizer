(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue purple green yellow orange - block
    robot1 - robot
  )
  (:init
    ;; left stack: purple on blue on red (red on table)
    (on purple blue)
    (on blue red)
    (ontable red)
    (clear purple)

    ;; single green block on table
    (ontable green)
    (clear green)

    ;; right stack: orange on yellow (yellow on table)
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      (ontable blue)
      (on purple blue)
      (on green purple)
      (on orange green)
      (on yellow orange)
      (on red yellow)
    )
  )
)