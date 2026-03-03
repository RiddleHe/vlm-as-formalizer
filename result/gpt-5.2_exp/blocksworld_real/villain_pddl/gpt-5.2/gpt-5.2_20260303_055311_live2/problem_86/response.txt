(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange purple blue yellow red - block
    robot1 - robot
  )
  (:init
    ;; stacks observed in the image
    (on red green)
    (on yellow orange)

    ;; blocks on the table
    (ontable green)
    (ontable orange)
    (ontable purple)
    (ontable blue)

    ;; clear blocks (nothing on top)
    (clear red)
    (clear yellow)
    (clear purple)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: green over orange over purple over blue
      (on green orange)
      (on orange purple)
      (on purple blue)

      ;; stack 2: yellow over red
      (on yellow red)
    )
  )
)