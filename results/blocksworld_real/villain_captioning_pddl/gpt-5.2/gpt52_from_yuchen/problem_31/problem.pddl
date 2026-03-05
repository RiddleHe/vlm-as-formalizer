(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    orange red yellow purple blue green - block
    robot1 - robot
  )
  (:init
    ;; robot state
    (handempty robot1)

    ;; current stack: orange on red on yellow
    (on orange red)
    (on red yellow)
    (ontable yellow)

    ;; other blocks on table
    (ontable purple)
    (ontable blue)
    (ontable green)

    ;; clear blocks
    (clear orange)
    (clear purple)
    (clear blue)
    (clear green)
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