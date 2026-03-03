(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    blue - block
    orange - block
    purple - block
    yellow - block
    green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; blocks on table (from image: one stack exists: red on blue; others are separate)
    (ontable blue)
    (ontable orange)
    (ontable purple)
    (ontable yellow)
    (ontable green)

    ;; stacked pair in the scene
    (on red blue)

    ;; clear blocks (no block on top)
    (clear red)
    (clear orange)
    (clear purple)
    (clear yellow)
    (clear green)

    ;; blue is not clear because red is on it
  )
  (:goal
    (and
      (on blue orange)
      (on orange purple)
      (on purple yellow)
      (on yellow green)
      (on green red)
    )
  )
)