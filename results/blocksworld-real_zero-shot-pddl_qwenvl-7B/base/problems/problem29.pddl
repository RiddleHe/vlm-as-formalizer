(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    blue_block - block
    orange_block - block
    green_block - block
    purple_block - block
    red_block - block
    yellow_block - block
    robot1 - robot
)
(:init
    (clear blue_block)
    (ontable blue_block)
    (clear orange_block)
    (ontable orange_block)
    (clear green_block)
    (ontable green_block)
    (clear purple_block)
    (ontable purple_block)
    (clear red_block)
    (ontable red_block)
    (clear yellow_block)
    (ontable yellow_block)
    (handempty robot1)
)
(:goal (and
    (on purple_block orange_block)
    (on orange_block green_block)
    (on green_block red_block)
    (on red_block yellow_block)
    (on yellow_block blue_block)
))
)