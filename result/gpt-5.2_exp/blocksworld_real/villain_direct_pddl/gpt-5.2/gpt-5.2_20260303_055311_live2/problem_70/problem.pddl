(define (problem blocksworld_scene1)
  (:domain blocksworld)
  (:objects
    green blue yellow purple orange red - block
    robot1 - robot
  )
  (:init
    ;; Robot
    (handempty robot1)

    ;; Current scene (from image):
    ;; Stack: green on blue on yellow on purple, with green clear.
    (on green blue)
    (on blue yellow)
    (on yellow purple)
    (ontable purple)
    (clear green)

    ;; Red block is alone on the table and clear.
    (ontable red)
    (clear red)

    ;; Orange block is on top of the stack and clear.
    ;; (As shown in later images: orange on green)
    (on orange green)
    (clear orange)

    ;; Blocks that have something on them are not clear
    (not (clear blue))
    (not (clear yellow))
    (not (clear purple))
    (not (clear green))
  )
  (:goal
    (and
      ;; Goal stack: yellow over red over orange over blue over purple over green
      (on yellow red)
      (on red orange)
      (on orange blue)
      (on blue purple)
      (on purple green)
      (ontable green)
    )
  )
)