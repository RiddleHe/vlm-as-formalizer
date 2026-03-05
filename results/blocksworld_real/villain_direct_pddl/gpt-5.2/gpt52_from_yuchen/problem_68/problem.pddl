(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red blue orange purple green yellow - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene: red on blue on orange, with orange on table
    (on red blue)
    (on blue orange)
    (ontable orange)

    ;; single blocks on the table
    (ontable purple)
    (ontable green)
    (ontable yellow)

    ;; clear blocks (nothing on top)
    (clear red)
    (clear purple)
    (clear green)
    (clear yellow)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on orange red)
      (on red green)
      (on green blue)
      (on blue purple)
      (on purple yellow)
    )
  )
)