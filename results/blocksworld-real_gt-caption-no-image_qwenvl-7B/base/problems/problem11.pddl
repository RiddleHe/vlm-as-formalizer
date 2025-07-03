(define (problem blocksworld)
    (:domain blocksworld)
    (:objects
        P1 - block
        Y1 - block
        B1 - block
        R1 - block
        G1 - block
        O1 - block
        robot1 - robot
    )
    (:init
        (clear P1)
        (clear Y1)
        (clear B1)
        (clear R1)
        (clear G1)
        (clear O1)
        (ontable P1)
        (ontable Y1)
        (ontable B1)
        (ontable R1)
        (ontable G1)
        (ontable O1)
        (handempty robot1)
        (on P1 Y1)
        (on B1 R1)
        (on R1 G1)
        (on G1 O1)
    )
    (:goal
        (and
            (on G1 B1)
            (on B1 P1)
            (on P1 Y1)
            (on R1 Y1)
        )
    )
)