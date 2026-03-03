(define (problem blocksworld_scene_stacks_2)
  (:domain blocksworld)
  (:objects
    orange red yellow purple green blue - block
    robot1 - robot
  )
  (:init
    ;; tower: orange on red on yellow (yellow on table)
    (on orange red)
    (on red yellow)
    (ontable yellow)
    (clear orange)

    ;; single blocks on table
    (ontable purple)
    (clear purple)
    (ontable green)
    (clear green)
    (ontable blue)
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