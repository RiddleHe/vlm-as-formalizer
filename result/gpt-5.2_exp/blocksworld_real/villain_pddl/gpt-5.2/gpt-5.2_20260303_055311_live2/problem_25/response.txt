(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    orange red yellow blue purple green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; current scene (from visual analysis)
    ;; left small stack: blue on orange; purple on table
    (on blue orange)
    (ontable orange)
    (clear blue)
    (not (clear orange))
    (ontable purple)
    (clear purple)

    ;; right stack: yellow on red on green
    (on yellow red)
    (on red green)
    (ontable green)
    (clear yellow)
    (not (clear red))
    (not (clear green))
  )
  (:goal
    (and
      ;; stack 1: orange over red over yellow
      (on orange red)
      (on red yellow)

      ;; stack 2: blue over purple over green
      (on blue purple)
      (on purple green)
    )
  )
)