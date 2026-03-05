(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    red - block
    blue - block
    purple - block
    pink - block
    robot1 - robot
  )
  (:init
    ;; arm state
    (handempty robot1)

    ;; block positions from the image
    (ontable blue)
    (on purple blue)
    (on pink purple)
    (ontable red)

    ;; clear status
    (clear pink)
    (clear red)
  )
  (:goal
    (and
      (on red blue)
      (on blue purple)
      (on purple pink)
    )
  )
)