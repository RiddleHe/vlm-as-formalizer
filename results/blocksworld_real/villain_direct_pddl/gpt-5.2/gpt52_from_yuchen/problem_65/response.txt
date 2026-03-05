(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red purple blue orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; initial configuration from the image
    (on red purple)
    (on purple blue)
    (ontable blue)

    (ontable orange)
    (ontable yellow)
    (ontable green)

    (clear red)
    (clear orange)
    (clear yellow)
    (clear green)

    (handempty robot1)
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