(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green purple yellow orange red blue - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except blue which is on red (as seen in the images)
    (ontable green)
    (ontable purple)
    (ontable yellow)
    (ontable orange)
    (ontable red)
    (on blue red)

    ;; clear blocks
    (clear green)
    (clear purple)
    (clear yellow)
    (clear orange)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on green purple)
      (on purple red)
      (on red blue)
      (on blue yellow)
      (on yellow orange)
    )
  )
)