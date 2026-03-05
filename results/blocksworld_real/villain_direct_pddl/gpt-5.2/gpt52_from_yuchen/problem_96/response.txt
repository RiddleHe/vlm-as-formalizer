(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red yellow purple blue green orange - block
    robot1 - robot
  )
  (:init
    ;; Stack in the scene (top to bottom): red on yellow on purple on blue on green
    (on red yellow)
    (on yellow purple)
    (on purple blue)
    (on blue green)
    (ontable green)

    ;; Orange block is separate on the table
    (ontable orange)

    ;; Clear blocks
    (clear red)
    (clear orange)

    ;; Robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: yellow over blue
      (on yellow blue)

      ;; Stack 2: purple over red over green over orange
      (on purple red)
      (on red green)
      (on green orange)
    )
  )
)