(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    orange_block1 - block
    orange_block2 - block
    orange_block3 - block
    orange_block4 - block
    orange_block5 - block
    orange_block6 - block
    robot1 - robot
)
(:init
    (ontable orange_block1)
    (clear orange_block1)
    (handempty robot1)
    (ontable orange_block2)
    (clear orange_block2)
    (ontable orange_block3)
    (clear orange_block3)
    (ontable orange_block4)
    (clear orange_block4)
    (ontable orange_block5)
    (clear orange_block5)
    (ontable orange_block6)
    (clear orange_block6)
)
(:goal (and
    (on orange_block6 orange_block5)
    (on orange_block5 orange_block4)
    (on orange_block4 orange_block3)
    (on orange_block3 orange_block2)
    (on orange_block2 orange_block1)
    (on orange_block1 orange_block6)
))
)