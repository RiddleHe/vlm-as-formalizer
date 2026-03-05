(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red orange purple yellow blue green - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stack in the scene: orange on red on yellow (yellow on table)
    (on orange red)
    (on red yellow)
    (ontable yellow)
    (clear orange)

    ;; single blocks on table
    (ontable purple)
    (clear purple)

    (ontable blue)
    (clear blue)

    (ontable green)
    (clear green)
  )
  (:goal
    (and
      (on red purple)
      (on purple yellow)
      (ontable yellow)
      (clear red)

      (on orange blue)
      (on blue green)
      (ontable green)
      (clear orange)
    )
  )
)