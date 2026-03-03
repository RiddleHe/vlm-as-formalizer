(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow purple blue orange red green - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack A: blue on purple on yellow (yellow on table)
    (ontable yellow)
    (on purple yellow)
    (on blue purple)
    (clear blue)

    ;; Stack B: green on red on orange (orange on table)
    (ontable orange)
    (on red orange)
    (on green red)
    (clear green)
  )
  (:goal
    (and
      ;; Stack 1: blue over yellow
      (on blue yellow)
      (ontable yellow)

      ;; Stack 2: orange over red over purple over green
      (on orange red)
      (on red purple)
      (on purple green)
      (ontable green)
    )
  )
)