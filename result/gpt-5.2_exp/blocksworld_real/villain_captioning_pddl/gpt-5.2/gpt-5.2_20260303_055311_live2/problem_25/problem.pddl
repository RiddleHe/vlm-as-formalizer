(define (problem blocksworld_scene_2stacks)
  (:domain blocksworld)
  (:objects
    blue purple green red yellow orange - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; left grouping
    (on blue orange)
    (ontable orange)
    (clear blue)

    (ontable purple)
    (clear purple)

    ;; right grouping
    (on yellow red)
    (on red green)
    (ontable green)
    (clear yellow)
  )
  (:goal
    (and
      ;; Stack 1: orange over red over yellow
      (on orange red)
      (on red yellow)

      ;; Stack 2: blue over purple over green
      (on blue purple)
      (on purple green)
    )
  )
)