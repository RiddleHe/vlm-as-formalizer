(define (problem blocksworld_two_stacks)
  (:domain blocksworld)
  (:objects
    green yellow pink purple orange red - block
    robot1 - robot
  )
  (:init
    ;; Current stack in the image (bottom to top):
    (ontable green)
    (on yellow green)
    (on pink yellow)
    (on purple pink)
    (on orange purple)
    (on red orange)

    ;; Clear/hand state
    (clear red)
    (handempty robot1)
  )
  (:goal
    (and
      ;; Stack 1: green over yellow over pink (top to bottom: green, yellow, pink)
      (on green yellow)
      (on yellow pink)

      ;; Stack 2: purple over orange over red (top to bottom: purple, orange, red)
      (on purple orange)
      (on orange red)

      ;; Both stacks must be based on the table (pink and red are bottoms)
      (ontable pink)
      (ontable red)
    )
  )
)