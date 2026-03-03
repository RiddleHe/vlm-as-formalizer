(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    yellow blue red orange purple green - block
    robot1 - robot
  )
  (:init
    (handempty robot1)

    ;; Initial stacks from visual analysis:
    ;; Stack 1: yellow on blue (both on table via blue)
    (on yellow blue)
    (ontable blue)
    (clear yellow)

    ;; Stack 2: green on purple on orange (orange on table)
    (on green purple)
    (on purple orange)
    (ontable orange)
    (clear green)

    ;; Single block on table
    (ontable red)
    (clear red)

    ;; Blocks that have something on them are not clear (implicit via absence of (clear ...))
  )
  (:goal
    (and
      ;; Create 2 stacks:
      ;; purple over green over blue over yellow
      (on purple green)
      (on green blue)
      (on blue yellow)
      (ontable yellow)

      ;; orange over red
      (on orange red)
      (ontable red)
    )
  )
)