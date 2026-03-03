(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue purple green yellow orange - block
    robot1 - robot
  )
  (:init
    ;; left stack: purple on blue on red
    (on purple blue)
    (on blue red)
    (ontable red)
    (clear purple)

    ;; middle single block
    (ontable green)
    (clear green)

    ;; right stack: orange on yellow
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on red yellow)
      (on yellow orange)
      (on orange green)
      (on green purple)
      (on purple blue)
    )
  )
)