(define (problem blocksworld_scene)
  (:domain blocksworld)
  (:objects
    Block_B - block
    Block_P - block
    Block_O - block
    Block_Y - block
    Block_R - block
    Block_G - block
    Robot_1 - robot
  )
  (:init
    ;; robot state
    (handempty Robot_1)

    ;; stack 1: red on green (green on table)
    (ontable Block_G)
    (on Block_R Block_G)
    (clear Block_R)

    ;; stack 2: yellow on orange (orange on table)
    (ontable Block_O)
    (on Block_Y Block_O)
    (clear Block_Y)

    ;; single blocks on table
    (ontable Block_B)
    (clear Block_B)
    (ontable Block_P)
    (clear Block_P)
  )
  (:goal
    (and
      ;; Stack: green over orange over purple over blue
      (on Block_G Block_O)
      (on Block_O Block_P)
      (on Block_P Block_B)

      ;; Stack: yellow over red
      (on Block_Y Block_R)
    )
  )
)