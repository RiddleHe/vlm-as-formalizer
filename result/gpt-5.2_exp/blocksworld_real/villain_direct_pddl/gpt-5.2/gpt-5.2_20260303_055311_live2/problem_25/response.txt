(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red yellow blue purple green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; left stack: blue on orange, orange on table
    (on blue orange)
    (ontable orange)
    (clear blue)

    ;; purple block on table
    (ontable purple)
    (clear purple)

    ;; right stack: yellow on red on green, green on table
    (on yellow red)
    (on red green)
    (ontable green)
    (clear yellow)
  )
  (:goal
    (and
      ;; stack 1: orange over red over yellow  (i.e., orange on red on yellow)
      (on orange red)
      (on red yellow)

      ;; stack 2: blue over purple over green (i.e., blue on purple on green)
      (on blue purple)
      (on purple green)
    )
  )
)