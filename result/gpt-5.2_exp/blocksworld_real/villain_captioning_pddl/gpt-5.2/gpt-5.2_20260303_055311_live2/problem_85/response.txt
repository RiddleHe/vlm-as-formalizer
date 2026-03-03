(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    green orange purple red blue yellow - block
    robot1 - robot
  )
  (:init
    ;; tower configuration (top to bottom): green -> orange -> purple -> red -> blue -> yellow (on table)
    (on green orange)
    (on orange purple)
    (on purple red)
    (on red blue)
    (on blue yellow)
    (ontable yellow)

    ;; clear status
    (clear green)

    ;; robot state
    (handempty robot1)
  )
  (:goal
    (and
      ;; Instruction: Create 1 stack: red over orange over yellow over blue over green over purple
      (on red orange)
      (on orange yellow)
      (on yellow blue)
      (on blue green)
      (on green purple)
      (ontable purple)
    )
  )
)