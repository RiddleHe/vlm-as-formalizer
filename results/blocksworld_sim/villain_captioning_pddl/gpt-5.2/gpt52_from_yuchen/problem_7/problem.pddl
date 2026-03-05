(define (problem blocksworld_scene1_stackgoal)
  (:domain blocksworld)
  (:objects
    yellow pink green red purple blue - block
    robot1 - robot
  )

  (:init
    ;; Robot state
    (handempty robot1)

    ;; Left stack: yellow on pink on green (green on table)
    (on yellow pink)
    (on pink green)
    (ontable green)
    (clear yellow)

    ;; Middle stack: red on purple (purple on table)
    (on red purple)
    (ontable purple)
    (clear red)

    ;; Right single block: blue on table
    (ontable blue)
    (clear blue)
  )

  (:goal
    (and
      (on yellow pink)
      (on pink green)
      (on green red)
      (on red purple)
      (on purple blue)
    )
  )
)