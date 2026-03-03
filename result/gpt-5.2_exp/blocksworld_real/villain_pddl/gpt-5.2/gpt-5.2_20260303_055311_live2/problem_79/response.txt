(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue purple yellow green orange red - block
    robot1 - robot
  )
  (:init
    ;; robot
    (handempty robot1)

    ;; stacks and table placements inferred from the images:
    ;; right stack: green on red on orange, with orange on table
    (on green red)
    (on red orange)
    (ontable orange)
    (clear green)

    ;; single blocks on table
    (ontable blue)
    (clear blue)

    (ontable purple)
    (clear purple)

    (ontable yellow)
    (clear yellow)
  )
  (:goal
    (and
      ;; create 3 stacks as instructed
      (on blue orange)
      (on purple green)
      (on yellow red)
    )
  )
)