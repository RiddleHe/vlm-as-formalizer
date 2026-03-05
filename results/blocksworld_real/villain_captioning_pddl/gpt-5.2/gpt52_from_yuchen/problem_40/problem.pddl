(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    Block_O Block_B Block_Y Block_P Block_G Block_R - block
    Robot_1 - robot
  )
  (:init
    ;; all blocks are on the table and clear
    (ontable Block_O) (clear Block_O)
    (ontable Block_B) (clear Block_B)
    (ontable Block_Y) (clear Block_Y)
    (ontable Block_P) (clear Block_P)
    (ontable Block_G) (clear Block_G)
    (ontable Block_R) (clear Block_R)

    ;; robot is available and has an empty hand
    (handempty Robot_1)
  )
  (:goal
    (and
      ;; stack 1: purple over blue over yellow over orange
      (on Block_P Block_B)
      (on Block_B Block_Y)
      (on Block_Y Block_O)

      ;; stack 2: green over red
      (on Block_G Block_R)
    )
  )
)