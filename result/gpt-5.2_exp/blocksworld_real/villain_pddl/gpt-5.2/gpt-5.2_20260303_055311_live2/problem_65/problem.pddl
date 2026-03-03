(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red purple blue orange green yellow - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; left stack in the scene: red on purple on blue (blue on table)
    (on red purple)
    (on purple blue)
    (ontable blue)
    (clear red)

    ;; other blocks on the table
    (ontable orange)
    (clear orange)

    (ontable green)
    (clear green)

    (ontable yellow)
    (clear yellow)
  )
  (:goal
    (and
      ;; stack 1
      (on green red)

      ;; stack 2
      (on yellow purple)
      (on purple blue)
      (on blue orange)
    )
  )
)