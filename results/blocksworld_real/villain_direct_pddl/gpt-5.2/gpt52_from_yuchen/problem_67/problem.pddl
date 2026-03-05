(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green yellow purple blue orange - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Table placements (from the image: blue has red stacked on it; others on table)
    (on red blue)
    (ontable blue)

    (ontable purple)
    (ontable yellow)
    (ontable green)
    (ontable orange)

    ;; Clear conditions
    (clear red)
    (clear purple)
    (clear yellow)
    (clear green)
    (clear orange)
    ;; blue is not clear because red is on it
  )
  (:goal
    (and
      (on red green)
      (on yellow purple)
      (on blue orange)
    )
  )
)