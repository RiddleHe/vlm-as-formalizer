(define (problem put_soap_on_rack)
    (:domain put_task)
    (:objects
        agent - agent
        steel-rack - receptacle
        sink - receptacle
        pink-soap - object
        greenish-yellow-soap - object
        brown-cylinder - object
    )
    (:init
        (not (atLocation agent steel-rack))
        (not (atLocation agent sink))
        (not (holdsAny agent))
        (inReceptacle greenish-yellow-soap steel-rack)
        (inReceptacle pink-soap sink)
        (not (openable steel-rack))
        (not (openable sink))
        (not (isClean pink-soap))
        (not (isClean greenish-yellow-soap))
        (not (isHot pink-soap))
        (not (isHot greenish-yellow-soap))
        (not (isCool pink-soap))
        (not (isCool greenish-yellow-soap))
        (not (isSliced pink-soap))
        (not (isSliced greenish-yellow-soap))
        (not (isToggled pink-soap))
        (not (isToggled greenish-yellow-soap))
    )
    (:goal (and
        (inReceptacle pink-soap steel-rack)
        (inReceptacle greenish-yellow-soap steel-rack)
    ))
)