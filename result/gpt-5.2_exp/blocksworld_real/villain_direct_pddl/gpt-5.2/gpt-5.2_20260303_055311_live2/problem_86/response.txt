(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red green blue purple yellow orange - block
    robot1 - robot
  )
  (:init
    ;; Robot state
    (handempty robot1)

    ;; Stack 1 (left): red on green
    (on red green)
    (clear red)

    ;; green is not clear because red is on it
    ;; (clear green) is false

    ;; Stack 2 (right): yellow on orange
    (on yellow orange)
    (clear yellow)

    ;; orange is not clear because yellow is on it
    ;; (clear orange) is false

    ;; Single blocks on table
    (ontable green)
    (ontable orange)
    (ontable blue)
    (ontable purple)

    (clear blue)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack: green over orange over purple over blue
      (on green orange)
      (on orange purple)
      (on purple blue)

      ;; Stack: yellow over red
      (on yellow red)
    )
  )
)