(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    purple green red orange blue yellow - block
    robot1 - robot
  )
  (:init
    ;; stacks in the scene
    (on red orange)
    (ontable orange)
    (clear red)

    (on blue yellow)
    (ontable yellow)
    (clear blue)

    ;; single blocks on table
    (ontable purple)
    (clear purple)

    (ontable green)
    (clear green)

    ;; blocks that are not clear (because something is on them)
    ;; (orange has red on it; yellow has blue on it)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      (on purple blue)
      (on red orange)
      (on yellow green)
    )
  )
)