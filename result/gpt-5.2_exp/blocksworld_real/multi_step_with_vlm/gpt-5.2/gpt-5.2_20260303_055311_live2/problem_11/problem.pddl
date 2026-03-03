(define (problem blocksworld)    (:domain blocksworld)    (:objects
        Blue_block - block
        Green_block - block
        Purple_block - block
        Orange_block - block
        Red_block - block
        Yellow_block - block
        Robot_arm - robot
    )
    (:init
        (on Blue_block Red_block)
        (on Purple_block Yellow_block)
        (on Red_block Green_block)
        (ontable Orange_block)
        (clear Blue_block)
        (clear Green_block)
        (clear Purple_block)
        (clear Orange_block)
        (handempty Robot_arm)
    )
    (:goal (and 
    (on Green_block Blue_block)
    (on Blue_block Purple_block)
    (on Purple_block Orange_block)
    (on Red_block Yellow_block)
)))
