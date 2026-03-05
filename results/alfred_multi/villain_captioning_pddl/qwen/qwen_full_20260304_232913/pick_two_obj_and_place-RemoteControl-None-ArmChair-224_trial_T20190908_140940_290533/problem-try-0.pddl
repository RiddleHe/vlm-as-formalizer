(define (problem move_remotes_to_chair)
    (:domain put_task)
    (:objects
        agent
        remote1
        remote2
        sofa
        chair
        pillow
        newspaper
        smartphone
        box
        statue
        trash_can
        fireplace
        rug
        floor
    )
    (:init
        ; Agent is not at any location initially
        (not (atLocation agent sofa))
        (not (atLocation agent chair))
        (not (atLocation agent remote1))
        (not (atLocation agent remote2))
        
        ; Remote1 is on the sofa
        (atLocation remote1 sofa)
        ; Remote2 is not visible, assume it's somewhere else (e.g., on floor or another surface)
        (atLocation remote2 floor)
        
        ; Chair is empty
        (not (inReceptacle remote1 chair))
        (not (inReceptacle remote2 chair))
        
        ; No object is held by agent
        (not (holdsAny agent))
        
        ; No receptacle is opened
        (not (opened sofa))
        (not (opened chair))
        
        ; Predicates not relevant to task are false
        (not (isClean remote1))
        (not (isClean remote2))
        (not (isHot remote1))
        (not (isHot remote2))
        (not (isCool remote1))
        (not (isCool remote2))
        (not (isSliced remote1))
        (not (isSliced remote2))
        (not (isOn remote1))
        (not (isOn remote2))
        (not (isToggled remote1))
        (not (isToggled remote2))
        
        ; Objects are not held
        (not (holds agent remote1))
        (not (holds agent remote2))
    )
    (:goal (and
        (inReceptacle remote1 chair)
        (inReceptacle remote2 chair)
    ))
)