(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange - block
    yellow - block
    green - block
    purple - block
    red - block
    blue - block
    robot1 - robot
  )
  (:init
    ;; stack seen in the image (left): green on blue on orange
    (on green blue)
    (on blue orange)
    (ontable orange)
    (clear green)

    ;; single blocks on the table
    (ontable yellow)
    (clear yellow)

    (ontable red)
    (clear red)

    (ontable purple)
    (clear purple)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange yellow)
      (on yellow green)
      (on green purple)
      (on purple red)
      (on red blue)
      (ontable blue)
    )
  )
)