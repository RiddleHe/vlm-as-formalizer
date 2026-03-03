(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    red yellow purple blue green orange - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Scene from image:
    ;; A single stack (top->bottom): red on yellow on purple on blue on green
    (on red yellow)
    (on yellow purple)
    (on purple blue)
    (on blue green)
    (ontable green)
    (clear red)

    ;; Orange block is separate on the table and clear
    (ontable orange)
    (clear orange)
  )
  (:goal
    (and
      ;; Stack 1: yellow over blue
      (on yellow blue)

      ;; Stack 2: purple over red over green over orange
      (on purple red)
      (on red green)
      (on green orange)
      (ontable orange)
    )
  )
)