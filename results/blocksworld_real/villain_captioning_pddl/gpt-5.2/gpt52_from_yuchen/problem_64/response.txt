(define (problem blocksworld_stacks_2)
  (:domain blocksworld)
  (:objects
    blue yellow purple orange red green - block
    robot1 - robot
  )
  (:init
    ;; stack on the right: green on red on orange (orange on table)
    (on green red)
    (on red orange)
    (ontable orange)

    ;; single blocks on table
    (ontable blue)
    (ontable yellow)
    (ontable purple)

    ;; clear conditions
    (clear green)
    (clear blue)
    (clear yellow)
    (clear purple)

    ;; robot hand state
    (handempty robot1)
  )
  (:goal
    (and
      ;; stack 1: orange over blue over red over purple
      (on orange blue)
      (on blue red)
      (on red purple)

      ;; stack 2: yellow over green
      (on yellow green)
    )
  )
)