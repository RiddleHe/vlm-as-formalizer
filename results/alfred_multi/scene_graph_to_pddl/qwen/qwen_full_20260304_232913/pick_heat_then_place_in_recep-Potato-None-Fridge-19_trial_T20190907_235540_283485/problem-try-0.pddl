(define (problem put_heated_potato_in_fridge)
    (:domain put_task)
    (:objects
        agent
        microwave - receptacle
        fridge - receptacle
        sink - receptacle
        knife - object
        potato - object
        apple - object
        book - object
        plate - object
        coffee_maker - object
        fork - object
        bread - object
        spatula - object
        bottle - object
        table - object
    )
    (:init
        (openable fridge)
        (openable microwave)
        (openable sink)
        (isOn microwave)
        (isToggled microwave)
        (inReceptacle potato table)
        (inReceptacle apple table)
        (inReceptacle book table)
        (inReceptacle plate table)
        (inReceptacle coffee_maker table)
        (inReceptacle fork table)
        (inReceptacle knife table)
        (inReceptacle bread table)
        (inReceptacle spatula table)
        (inReceptacle bottle table)
    )
    (:goal (and
        (inReceptacle potato fridge)
        (isHot potato)
    ))
)