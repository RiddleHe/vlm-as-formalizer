(define (problem put_heated_potato_slice)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        knife - knife
        black_table - receptacle
        gray_table - receptacle
        gray_cabinet - receptacle
        potato - object
        salt_shaker - object
        apple - object
        mug - object
        vase - object
        lettuce - object
        bread - object
        egg - object
        soap_dispenser - object
        trash_bag - object
    )
    (:init
        (openable microwave)
        (isOn microwave)
        (inReceptacle potato black_table)
        (inReceptacle apple black_table)
        (inReceptacle salt_shaker black_table)
        (inReceptacle mug black_table)
        (inReceptacle vase gray_cabinet)
        (inReceptacle lettuce gray_table)
        (inReceptacle bread gray_table)
        (inReceptacle egg gray_table)
        (inReceptacle soap_dispenser gray_table)
        (not (holdsAny robot))
        (not (isSliced potato))
        (not (isHot potato))
    )
    (:goal
        (and
            (inReceptacle potato black_table)
            (isSliced potato)
            (isHot potato)
        )
    )
)