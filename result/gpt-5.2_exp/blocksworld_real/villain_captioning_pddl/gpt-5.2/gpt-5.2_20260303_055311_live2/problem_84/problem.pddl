(define (problem blocksworld_scene1)
  (:domain blocksworld)

  (:objects
    green blue red yellow orange purple - block
    robot1 - robot
  )

  (:init
    ;; robot state
    (handempty robot1)

    ;; stacked relationship in the scene
    (on purple red)

    ;; blocks on the table
    (ontable red)
    (ontable green)
    (ontable blue)
    (ontable yellow)
    (ontable orange)

    ;; clear blocks
    (clear purple)
    (clear green)
    (clear blue)
    (clear yellow)
    (clear orange)
    ;; red is not clear because purple is on it
  )

  (:goal
    (and
      (on green blue)
      (on blue red)
      (on red yellow)
      (on yellow orange)
      (on orange purple)
    )
  )
)