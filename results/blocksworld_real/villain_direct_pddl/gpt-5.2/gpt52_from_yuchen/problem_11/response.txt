(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue green red purple orange yellow - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions from the image
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
      ;; stack 1: green over blue over purple over orange
      (ontable orange)
      (on purple orange)
      (on blue purple)
      (on green blue)
      (clear green)

      ;; stack 2: red over yellow
      (ontable yellow)
      (on red yellow)
      (clear red)
    )
  )
)