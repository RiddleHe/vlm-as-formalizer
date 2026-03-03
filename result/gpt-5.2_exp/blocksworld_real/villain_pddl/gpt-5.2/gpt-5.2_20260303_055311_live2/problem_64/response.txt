(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue red purple orange yellow green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks and table positions from the image:
    ;; green on red on orange (tower), and blue/yellow/purple are on the table
    (on green red)
    (on red orange)
    (ontable orange)

    (ontable blue)
    (ontable yellow)
    (ontable purple)

    ;; clear blocks
    (clear green)
    (clear blue)
    (clear yellow)
    (clear purple)
  )
  (:goal
    (and
      ;; Stack 1: orange over blue over red over purple
      (on orange blue)
      (on blue red)
      (on red purple)

      ;; Stack 2: yellow over green
      (on yellow green)
    )
  )
)