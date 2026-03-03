(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow red purple orange - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current stacks from the image:
    ;; orange on blue on green (green on table)
    (on orange blue)
    (on blue green)
    (ontable green)
    (clear orange)

    ;; red on yellow (yellow on table)
    (on red yellow)
    (ontable yellow)
    (clear red)

    ;; purple on table
    (ontable purple)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: green over blue
      (on green blue)

      ;; Stack 2: yellow over red over purple over orange
      (on yellow red)
      (on red purple)
      (on purple orange)
    )
  )
)