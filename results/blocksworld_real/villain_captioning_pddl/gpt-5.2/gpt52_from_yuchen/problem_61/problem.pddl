(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow orange red green blue purple - block
    robot1 - robot
  )
  (:init
    ;; stack in the scene
    (on purple blue)

    ;; blocks on the table
    (ontable green)
    (ontable orange)
    (ontable yellow)
    (ontable red)
    (ontable blue)

    ;; clear blocks
    (clear purple)
    (clear green)
    (clear orange)
    (clear yellow)
    (clear red)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on yellow orange)
      (on blue red)
      (on green purple)
    )
  )
)