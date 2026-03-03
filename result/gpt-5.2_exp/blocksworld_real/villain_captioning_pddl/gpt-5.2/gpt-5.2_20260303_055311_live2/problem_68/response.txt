(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red green blue purple yellow - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene: red on blue on orange (orange on table)
    (on red blue)
    (on blue orange)
    (ontable orange)

    ;; single blocks on table
    (ontable purple)
    (ontable yellow)
    (ontable green)

    ;; clear blocks
    (clear red)
    (clear purple)
    (clear yellow)
    (clear green)

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
      (ontable yellow)
    )
  )
)