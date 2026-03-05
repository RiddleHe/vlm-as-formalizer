(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green yellow blue orange red purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table except the visible stack orange on blue
    (ontable green)
    (ontable yellow)
    (ontable red)
    (ontable purple)
    (ontable blue)

    (on orange blue)

    ;; clear conditions
    (clear green)
    (clear yellow)
    (clear red)
    (clear purple)
    (clear orange)

    ;; blue has orange on it, so it is not clear
    ;; robot initial state
    (handempty robot1)
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