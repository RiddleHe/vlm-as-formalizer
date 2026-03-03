(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    red - block
    yellow - block
    green - block
    blue - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; all blocks are on the table in the scene (no stacks initially)
    (ontable red)
    (ontable yellow)
    (ontable green)
    (ontable blue)
    (ontable purple)

    (clear red)
    (clear yellow)
    (clear green)
    (clear blue)
    (clear purple)

    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: blue over orange (interpreting "orange" as the red block visible)
      (on blue red)

      ;; stack 2: yellow over green over red over purple
      (on yellow green)
      (on green red)
      (on red purple)
    )
  )
)