(define (problem blocks_scene_stacks3)
  (:domain blocksworld)
  (:objects
    yellow red orange purple blue green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; block positions from the scene
    (on red yellow)
    (ontable yellow)
    (ontable orange)
    (ontable purple)
    (ontable blue)
    (ontable green)

    ;; clear conditions
    (clear red)
    (clear orange)
    (clear purple)
    (clear blue)
    (clear green)
  )
  (:goal
    (and
      (on yellow purple)
      (on blue red)
      (on orange green)
    )
  )
)