(define (problem put_pot_with_sponge_on_table)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        stove - object
        table - receptacle
        cabinet - receptacle
        pot1 pot2 - object
        knife - object
        sponge - object
    )
    (:init
        (not (atLocation robot microwave))
        (not (atLocation robot stove))
        (not (atLocation robot table))
        (not (atLocation robot cabinet))
        (not (atLocation robot pot1))
        (not (atLocation robot pot2))
        (not (atLocation robot knife))
        (not (atLocation robot sponge))
        (atLocation pot1 stove)
        (atLocation pot2 stove)
        (atLocation knife stove)
        (atLocation sponge sink) ; assumed location for sponge
        (openable microwave)
        (not (opened microwave))
        (not (isOn microwave))
        (not (isToggled microwave))
        (not (holdsAny robot))
        (not (isClean sponge))
        (not (isHot pot1))
        (not (isCool pot1))
        (not (isSliced pot1))
        (not (isHot pot2))
        (not (isCool pot2))
        (not (isSliced pot2))
    )
    (:goal (and
        (inReceptacle pot1 table)
        (inReceptacle sponge pot1)
    ))
)