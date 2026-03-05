(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red yellow green blue purple - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current stacks/placements from the image
    ;; Left stack: blue on orange, orange on table
    (on blue orange)
    (ontable orange)
    (clear blue)

    ;; Purple block is alone on the table
    (ontable purple)
    (clear purple)

    ;; Right stack: yellow on red on green, green on table
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