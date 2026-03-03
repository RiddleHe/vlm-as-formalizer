(define (problem blocksworld_scene_1)
  (:domain blocksworld)
  (:objects
    blue_block green_block orange_block yellow_block purple_block red_block - block
    rob1 - robot
  )
  (:init
    ;; robot state
    (handempty rob1)

    ;; stack in the scene
    (on green_block orange_block)
    (ontable orange_block)
    (clear green_block)

    ;; remaining blocks on table and clear
    (ontable blue_block)
    (clear blue_block)

    (ontable purple_block)
    (clear purple_block)

    (ontable yellow_block)
    (clear yellow_block)

    (ontable red_block)
    (clear red_block)
  )
  (:goal
    (and
      (on orange_block yellow_block)
      (on yellow_block purple_block)
      (on purple_block red_block)
      (on red_block blue_block)
      (on blue_block green_block)
      (ontable green_block)
    )
  )
)