(define (problem put_task_rags)
    (:domain put_task)
    (:objects
        agent1 - agent
        bathtub - receptacle
        sink - receptacle
        rag_red - object
        rag_brown - object
        soap_pink - object
    )
    (:init
        (not (atLocation agent1 bathtub))
        (not (atLocation agent1 sink))
        (not (holdsAny agent1))
        (inReceptacle rag_red bathtub)
        (inReceptacle rag_brown bathtub)
        (inReceptacle soap_pink sink)
        (not (isClean rag_red))
        (not (isClean rag_brown))
        (not (isHot rag_red))
        (not (isHot rag_brown))
        (not (isCool rag_red))
        (not (isCool rag_brown))
        (not (isSliced rag_red))
        (not (isSliced rag_brown))
        (not (isToggled rag_red))
        (not (isToggled rag_brown))
    )
    (:goal (and
        (inReceptacle rag_red sink)
        (inReceptacle rag_brown sink)
    ))
)