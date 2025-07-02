(define (problem color_stack)
  (:domain blocksworld)
  (:objects
     robot1 - robot
     green_block - block
     yellow_block - block
     purple_block - block
     red_block - block
     blue_block - block
     orange_block - block
  )
  (:init
     (handempty robot1)
     (clear green_block)
     (ontable green_block)
     (ontable yellow_block)
     (clear yellow_block)
     (ontable purple_block)
     (clear purple_block)
     (ontable red_block)
     (clear red_block)
     (ontable blue_block)
     (clear blue_block)
     (ontable orange_block)
  )
  (:goal
     (and
        (on orange_block yellow_block)
        (on yellow_block green_block)
        (on green_block purple_block)
        (on purple_block red_block)
        (on red_block blue_block)
     )
  )
)