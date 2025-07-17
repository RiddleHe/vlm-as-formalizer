;; Specification in PDDL1 of the Extended Task domain

(define (domain put_task)
 (:requirements
  :adl
 )
 (:types
  agent
  microwave fridge - receptacle
  knife receptacle - object
  )


 (:predicates
    (openable ?r - receptacle)                                ; true if a receptacle is openable
    (opened ?r - receptacle)                                  ; true if a receptacle is opened
    (inReceptacle ?o - object ?r - receptacle)                ; object ?o is in receptacle ?r
    (holds ?a - agent ?o - object)                            ; object ?o is held by agent ?a
    (holdsAny ?a - agent)                                     ; agent ?a holds an object
    (isClean ?o - object)                                     ; true if the object has been clean in sink
    (cleanable ?o - object)                                   ; true if the object can be placed in a sink
    (isHot ?o - object)                                       ; true if the object has been heated up
    (heatable ?o - object)                                    ; true if the object can be heated up in a microwave
    (isCool ?o - object)                                      ; true if the object has been cooled
    (coolable ?o - object)                                    ; true if the object can be cooled in the fridge
    (toggleable ?o - object)                                  ; true if the object can be turned on/off
    (isOn ?o - object)                                        ; true if the object is on
    (isToggled ?o - object)                                   ; true if the object has been toggled
    (sliceable ?o - object)                                   ; true if the object can be sliced
    (isSliced ?o - object)                                    ; true if the object is sliced
    (atLocation ?a - agent ?o - object)
 )

;; All actions are specified such that the final arguments are the ones used
;; for performing actions in Unity.

;; agent goes to receptacle
 (:action GotoLocation
    :parameters (?a - agent ?lEnd - object)
    :precondition (and
            (not (atLocation ?a ?lEnd))
            )
    :effect (and
                (atLocation ?a ?lEnd)
                (forall (?l - object)
                    (when (and (atLocation ?a ?l) (not (= ?l ?lEnd)))
                        (not (atLocation ?a ?l))))
            )
 )

;; agent opens receptacle
 (:action OpenObject
    :parameters (?a - agent ?r - receptacle)
    :precondition (and
            (atLocation ?a ?r)
            (openable ?r)
            )
    :effect (and
                (opened ?r)
            )
 )
;; agent closes receptacle
 (:action CloseObject
    :parameters (?a - agent ?r - receptacle)
    :precondition (and
            (atLocation ?a ?r)
            (openable ?r)
            (opened ?r)
            )
    :effect (and
                (not (opened ?r))
            )

 )

;; agent picks up object
 (:action PickupObjectInReceptacle
    :parameters (?a - agent ?o - object ?r - receptacle)
    :precondition (and
            (atLocation ?a ?r)
            (inReceptacle ?o ?r)
            (not (holdsAny ?a))
            )
    :effect (and
                (holds ?a ?o)
                (holdsAny ?a)
            )
 )

;; agent picks up object not in a receptacle
 (:action PickupObjectNoReceptacle
    :parameters (?a - agent ?o - object)
    :precondition (and
            (atLocation ?a ?o)
            (not (holdsAny ?a))
            (forall (?r - receptacle)
                (not (inReceptacle ?o ?r))
            )
            )
    :effect (and
                (holds ?a ?o)
                (holdsAny ?a)
            )
 )

;; agent puts down an object in a receptacle
 (:action PutObjectInReceptacle
    :parameters (?a - agent ?o - object ?r - receptacle)
    :precondition (and
            (atLocation ?a ?r)
            (holds ?a ?o)
            )
    :effect (and
                (inReceptacle ?o ?r)
                (not (holds ?a ?o))
                (not (holdsAny ?a))
            )
 )

;; agent cleans some object
 (:action CleanObject
    :parameters (?a - agent ?r - receptacle ?o - object)
    :precondition (and
            (atLocation ?a ?r)
            (holds ?a ?o)
            )
    :effect (and
                (isClean ?o)
            )
 )


;; agent heats-up some object
 (:action HeatObject
    :parameters (?a - agent ?r - microwave ?o - object)
    :precondition (and
            (atLocation ?a ?r)
            (holds ?a ?o)
            )
    :effect (and
                (isHot ?o)
            )
 )

;; agent cools some object
 (:action CoolObject
    :parameters (?a - agent ?r - fridge ?o - object)
    :precondition (and
            (atLocation ?a ?r)
            (holds ?a ?o)
            )
    :effect (and
                (isCool ?o)
            )
 )


;; agent toggle object
 (:action ToggleObject
    :parameters (?a - agent ?o - object)
    :precondition (and
            (atLocation ?a ?o)
            (toggleable ?o)
            )
    :effect (and
                (when (isOn ?o)
                    (not (isOn ?o)))
                (when (not (isOn ?o))
                    (isOn ?o))
                (isToggled ?o)
            )
 )


;; agent slices some object with a knife
 (:action SliceObject
    :parameters (?a - agent ?co - object ?ko - knife)
    :precondition
            (and
                (atLocation ?a ?co)
                (sliceable ?co)
                (holds ?a ?ko)
            )
    :effect (and
                (isSliced ?co)
            )
 )


)