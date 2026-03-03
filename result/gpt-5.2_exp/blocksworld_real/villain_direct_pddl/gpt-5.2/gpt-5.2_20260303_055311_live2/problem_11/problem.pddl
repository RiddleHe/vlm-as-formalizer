(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red orange purple yellow - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Block positions from the image
    (ontable yellow)
    (on purple yellow)
    (clear purple)

    (ontable green)
    (on red green)
    (on blue red)
    (clear blue)

    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      ;; Stack 1: green over blue over purple over orange
      (on green blue)
      (on blue purple)
      (on purple orange)

      ;; Stack 2: red over yellow
      (on red yellow)
    )
  )
)