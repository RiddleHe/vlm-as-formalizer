(define (problem put_cushions_on_ottoman)
    (:domain put_task)
    (:objects
        robot - agent
        dark_ottoman - receptacle
        dark_armchair - receptacle
        dark_sofa - receptacle
        orange_plaid_cushion - object
        green_cushion - object
        remote_control - object
    )
    (:init
        (atLocation robot dark_armchair)
        (inReceptacle orange_plaid_cushion dark_armchair)
        (inReceptacle remote_control dark_ottoman)
        (inReceptacle orange_plaid_cushion dark_sofa)
        (inReceptacle green_cushion dark_sofa)
        (inReceptacle remote_control dark_sofa)
    )
    (:goal (and
        (inReceptacle orange_plaid_cushion dark_ottoman)
        (inReceptacle green_cushion dark_ottoman)
    ))
)