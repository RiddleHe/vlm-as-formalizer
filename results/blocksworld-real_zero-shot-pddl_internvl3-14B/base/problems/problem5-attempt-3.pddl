(define (problem blocksworld_problem)
    (:domain blocksworld)
    (:objects
        yellow_block purple_block blue_block red_block orange_block green_block robot1 - block
    )
    (:init
        ; All blocks are on the table and clear
        (ontable yellow_block) (clear yellow_block)
        (ontable purple_block) (clear purple_block)
        (ontable blue_block) (clear blue_block)
        (ontable red_block) (clear red_block)
        (ontable orange_block) (clear orange_block)
        (ontable green_block) (clear green_block)

        ; Robot is initially without any block
        (handempty robot1)
    )
    (:goal
        ; Create 3 stacks: yellow over purple, blue over red, orange over green
        (and
            (on yellow_block purple_block)
            (clear purple_block)
            
            (on blue_block red_block)
            (clear red_block)
            
            (on orange_block green_block)
            (clear green_block)
        )
    )
)