(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    Block_Blue Block_Green Block_Red Block_Orange Block_Yellow Block_Purple - block
    Robot_1 - robot
  )

  (:init
    ;; robot state
    (handempty Robot_1)

    ;; on-table single blocks
    (ontable Block_Blue)
    (clear Block_Blue)

    (ontable Block_Green)
    (clear Block_Green)

    (ontable Block_Red)
    (clear Block_Red)

    ;; existing stack: Yellow (bottom) - Orange - Purple (top)
    (ontable Block_Yellow)
    (on Block_Orange Block_Yellow)
    (on Block_Purple Block_Orange)

    ;; clear/non-clear status implied by stack
    (clear Block_Purple)
    ;; Block_Orange and Block_Yellow are not clear (no explicit negative predicates in STRIPS)
  )

  (:goal
    (and
      ;; Stack 1: yellow over orange over red over purple
      (on Block_Yellow Block_Orange)
      (on Block_Orange Block_Red)
      (on Block_Red Block_Purple)

      ;; Stack 2: blue over green
      (on Block_Blue Block_Green)
    )
  )
)