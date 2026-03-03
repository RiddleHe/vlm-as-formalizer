(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green blue orange yellow purple - block
    robot1 - robot
  )
  (:init
    ;; stacks observed in the scene
    (on blue orange)
    (ontable orange)
    (clear blue)

    (on red green)
    (on green yellow)
    (ontable yellow)
    (clear red)

    ;; single block on table
    (ontable purple)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over yellow over orange over blue
      (on red yellow)
      (on yellow orange)
      (on orange blue)
      ;; stack 2: green over purple
      (on green purple)
    )
  )
)