(define (problem heat_apple_and_place)
    (:domain put_task)
    (:objects
        robot - agent
        microwave - microwave
        sink - sink
        fridge - fridge
        table - receptacle
        pan - receptacle
        plate - receptacle
        cup - receptacle
        drawer - receptacle
        apple - object
        knife - knife
        spatula - object
        fork - object
        pencil - object
        lettuce - object
        potato - object
        tomato - object
        spoon - object
        bottle - object
        book - object
        stove - object
    )
    (:init
        (openable microwave)
        (not (opened microwave))
        (atLocation robot table)
        (inReceptacle apple table)
        (inReceptacle knife table)
        (inReceptacle spatula book)
        (inReceptacle fork table)
        (inReceptacle pencil table)
        (inReceptacle lettuce table)
        (inReceptacle potato table)
        (inReceptacle tomato table)
        (inReceptacle spoon table)
        (inReceptacle bottle table)
        (inReceptacle book table)
        (inReceptacle pan table)
        (inReceptacle plate table)
        (not (isHot apple))
        (not (isSliced apple))
        (not (isClean apple))
        (not (isCool apple))
        (not (holdsAny robot))
        (not (isOn microwave))
        (not (isToggled microwave))
    )
    (:goal
        (and
            (inReceptacle apple table)
            (isHot apple)
            (atLocation robot table)
            (forall (?o - object)
                (when (and (inReceptacle ?o table) (not (= ?o apple)))
                    (not (atLocation robot ?o))))
        )
    )
)