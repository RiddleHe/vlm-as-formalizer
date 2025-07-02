(define (problem blocksworld)
(:domain blocksworld)
(:requirements :strips :typing)
(:objects
    purple_block
    yellow_block
    orange_block
    blue_block
    red_block
    green_block
    robot1
)
(:init
    (clear purple_block)
    (clear yellow_block)
    (clear orange_block)
    (clear blue_block)
    (clear red_block)
    (clear green_block)
    (ontable purple_block)
    (ontable yellow_block)
    (ontable orange_block)
    (ontable blue_block)
    (ontable red_block)
    (ontable green_block)
    (handempty robot1)
)
(:goal (and
    (on purple_block yellow_block)
    (on yellow_block orange_block)
    (on blue_block red_block)
    (on red_block green_block)
))
)