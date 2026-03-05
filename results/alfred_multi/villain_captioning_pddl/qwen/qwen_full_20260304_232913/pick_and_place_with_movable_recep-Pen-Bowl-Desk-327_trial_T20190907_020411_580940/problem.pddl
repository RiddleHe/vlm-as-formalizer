(define (problem put_pen_in_bowl_on_desk)
    (:domain put_task)
    (:objects
        agent - agent
        pen - object
        bowl1 bowl2 - receptacle
        cabinet - receptacle
        desk - receptacle
        nightstand - receptacle
        cd - object
        boots - object
        basketball - object
        laptop - object
        lamp - object
        clock - object
        chair - object
    )
    (:init
        (atLocation agent cabinet) ; assuming initial position near cabinet for simplicity, though caption says not at any object; we pick one to start
        (inReceptacle pen nightstand)
        (inReceptacle bowl1 cabinet)
        (inReceptacle bowl2 cabinet)
        (inReceptacle laptop desk)
        (inReceptacle lamp nightstand)
        (inReceptacle clock nightstand)
        (openable bowl1)
        (openable bowl2)
        (openable cabinet)
        (openable desk)
        (openable nightstand)
        (opened bowl1) ; bowls are open-top, so we consider them opened
        (opened bowl2)
        (opened cabinet)
        (opened desk)
        (opened nightstand)
        (not (holdsAny agent))
        (not (holds agent pen))
        (not (inReceptacle pen bowl1))
        (not (inReceptacle pen bowl2))
        (not (isClean pen))
        (not (isHot pen))
        (not (isCool pen))
        (not (isSliced pen))
        (not (isOn pen))
        (not (isToggled pen))
    )
    (:goal (and
        (inReceptacle pen bowl1) ; pen is in one of the bowls
        (inReceptacle bowl1 desk) ; the bowl containing pen is on the desk
    ))
)