(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue orange red purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; blocks on table (from image: all are on the table except blue on purple)
    (ontable orange)
    (ontable red)
    (ontable green)
    (ontable yellow)
    (ontable purple)

    ;; existing stack in the scene
    (on blue purple)

    ;; clear blocks (no block on top)
    (clear blue)
    (clear orange)
    (clear red)
    (clear green)
    (clear yellow)

    ;; purple is not clear because blue is on it
  )
  (:goal
    (and
      (on blue orange)
      (on orange red)
      (on red purple)
      (on purple green)
      (on green yellow)
    )
  )
)