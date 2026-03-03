(define (problem blocks_scene_01)
  (:domain blocksworld)
  (:objects
    red purple yellow orange blue green - block
    robot1 - robot
  )
  (:init
    ;; current stacks and table positions from the image
    (on orange red)
    (on red yellow)
    (ontable yellow)

    (ontable purple)
    (ontable green)
    (ontable blue)

    ;; clear conditions
    (clear orange)
    (clear purple)
    (clear green)
    (clear blue)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: red over purple over yellow
      (on red purple)
      (on purple yellow)
      (ontable yellow)

      ;; stack 2: orange over blue over green
      (on orange blue)
      (on blue green)
      (ontable green)
    )
  )
)