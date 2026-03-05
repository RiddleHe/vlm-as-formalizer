(define (problem put_warm_bread_slice)
    (:domain put_task)
    (:objects
        agent1 - agent
        microwave1 - microwave
        sink1 - sink
        fridge1 - fridge
        counter1 - receptacle  ; counter in front of sink
        counter2 - receptacle  ; counter with apple, salt shaker, etc.
        counter3 - receptacle  ; counter with toaster
        knife_yellow - knife
        knife_black - knife
        bread - object
        apple_gold - object
        salt_shaker - object
        wine_glass - object
        black_rect_object - object
        toaster1 - object
        trash_can - object
    )
    (:init
        ; agent is not at any location initially
        (not (atLocation agent1 microwave1))
        (not (atLocation agent1 sink1))
        (not (atLocation agent1 fridge1))
        (not (atLocation agent1 counter1))
        (not (atLocation agent1 counter2))
        (not (atLocation agent1 counter3))
        (not (atLocation agent1 knife_yellow))
        (not (atLocation agent1 knife_black))
        (not (atLocation agent1 bread))
        (not (atLocation agent1 apple_gold))
        (not (atLocation agent1 salt_shaker))
        (not (atLocation agent1 wine_glass))
        (not (atLocation agent1 black_rect_object))
        (not (atLocation agent1 toaster1))
        (not (atLocation agent1 trash_can))

        ; receptacles properties
        (openable microwave1)
        (not (opened microwave1))
        (openable fridge1)
        ; sink1 is not openable (as per domain, sink is receptacle but not openable)
        ; counters are not openable

        ; objects locations
        (atLocation knife_yellow counter1)
        (atLocation knife_black counter2)
        (atLocation apple_gold counter2)
        (atLocation salt_shaker counter2)
        (atLocation wine_glass counter2)
        (atLocation black_rect_object counter2)
        (atLocation toaster1 counter3)
        (atLocation trash_can counter2)

        ; microwave is off
        (not (isOn microwave1))

        ; bread is not visible, so we assume it must be obtained from toaster or fridge
        ; we'll assume bread is initially in the toaster (common scenario)
        (inReceptacle bread toaster1)

        ; no object is held by agent
        (not (holdsAny agent1))

        ; no object is clean, hot, cool, sliced, or toggled initially
        (not (isClean bread))
        (not (isHot bread))
        (not (isCool bread))
        (not (isSliced bread))
        (not (isToggled microwave1))
    )
    (:goal (and
        ; bread must be sliced
        (isSliced bread)
        ; bread must be heated
        (isHot bread)
        ; bread must be on the counter in front of the sink (counter1)
        (inReceptacle bread counter1)
    ))
)