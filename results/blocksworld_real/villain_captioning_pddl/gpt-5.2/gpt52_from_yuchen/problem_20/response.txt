(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue green red yellow orange purple - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; table placements
    (ontable blue)
    (ontable green)
    (ontable red)
    (ontable yellow)

    ;; existing stack on the right: purple on orange on yellow
    (on orange yellow)
    (on purple orange)

    ;; clear blocks
    (clear blue)
    (clear green)
    (clear red)
    (clear purple)
  )
  (:goal
    (and
      ;; stack 1: yellow over orange over red over purple
      (on yellow orange)
      (on orange red)
      (on red purple)

      ;; stack 2: blue over green
      (on blue green)
    )
  )
)