(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Block positions from the image
    (ontable red)
    (ontable orange)
    (ontable blue)
    (ontable green)
    (ontable purple)
    (ontable yellow)

    ;; All blocks are clear (no block on top), except none are stacked in the initial scene
    (clear red)
    (clear orange)
    (clear blue)
    (clear green)
    (clear purple)
    (clear yellow)
  )
  (:goal
    (and
      (on yellow orange)
      (on orange purple)
      (on purple green)
      (on green blue)
      (on blue red)
    )
  )
)