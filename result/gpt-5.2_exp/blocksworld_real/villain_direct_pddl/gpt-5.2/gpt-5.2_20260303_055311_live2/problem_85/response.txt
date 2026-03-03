(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green orange purple red blue yellow - block
    robot1 - robot
  )
  (:init
    ;; initial stack as seen in the image (top to bottom):
    ;; green on orange on purple on red on blue on yellow
    (on green orange)
    (on orange purple)
    (on purple red)
    (on red blue)
    (on blue yellow)
    (ontable yellow)

    (clear green)
    (handempty robot1)
  )
  (:goal
    (and
      ;; goal stack (top to bottom):
      ;; red over orange over yellow over blue over green over purple
      (on red orange)
      (on orange yellow)
      (on yellow blue)
      (on blue green)
      (on green purple)
      (ontable purple)
      (clear red)
    )
  )
)