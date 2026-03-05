(define (problem slice_lettuce)
    (:domain put_task)
    (:objects
        robot - agent
        knife - knife
        lettuce - object
        tomato - object
        apple - object
        saltshaker - object
        spatula - object
        mug - object
        coffeemachine - object
        wineglass - object
        table - object
    )
    (:init
        (atLocation robot table)
        (not (holdsAny robot))
        (not (isSliced lettuce))
        (not (holds robot knife))
        (not (holds robot lettuce))
    )
    (:goal (and (isSliced lettuce)))
)