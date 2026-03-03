(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue purple green yellow orange - block
    robot1 - robot
  )
  (:init
    ;; left stack: purple on blue on red, with red on table
    (on purple blue)
    (on blue red)
    (ontable red)
    (clear purple)

    ;; single green block on table
    (ontable green)
    (clear green)

    ;; right stack: orange on yellow, with yellow on table
    (on orange yellow)
    (ontable yellow)
    (clear orange)

    ;; robot starts free
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