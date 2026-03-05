(define (problem slice_lettuce)
    (:domain put_task)
    (:objects
        agent1 - agent
        table - receptacle
        knife - knife
        lettuce - object
        tomato - object
        apple - object
        saltshaker - object
        mug - object
        wineglass - object
        coffee_machine - object
    )
    (:init
        (atLocation agent1 table)
        (inReceptacle knife table)
        (inReceptacle lettuce table)
        (inReceptacle tomato table)
        (inReceptacle apple table)
        (inReceptacle saltshaker table)
        (inReceptacle mug coffee_machine)
        (inReceptacle wineglass table)
        (not (holdsAny agent1))
        (not (isSliced lettuce))
    )
    (:goal (and (isSliced lettuce)))
)