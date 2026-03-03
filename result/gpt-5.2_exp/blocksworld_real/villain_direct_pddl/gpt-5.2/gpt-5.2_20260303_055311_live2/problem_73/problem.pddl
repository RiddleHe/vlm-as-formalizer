(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    blue - block
    orange - block
    green - block
    yellow - block
    red - block
    purple - block
    robot1 - robot
  )
  (:init
    ;; stack 1 in the scene: blue on orange (and orange on table)
    (on blue orange)
    (ontable orange)
    (clear blue)

    ;; stack 2 in the scene: red on green on yellow (yellow on table)
    (on red green)
    (on green yellow)
    (ontable yellow)
    (clear red)

    ;; single block on table
    (ontable purple)
    (clear purple)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; first required stack: red over yellow over orange over blue
      (on red yellow)
      (on yellow orange)
      (on orange blue)

      ;; second required stack: green over purple
      (on green purple)
    )
  )
)