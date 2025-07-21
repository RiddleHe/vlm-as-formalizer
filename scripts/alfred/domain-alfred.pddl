;; Specification in PDDL1 of the Extended Task domain

(define (domain put_task)
 (:requirements
  :adl
 )
 (:types
  agent
  microwave fridge sink - receptacle
  knife receptacle - object
  )


 (:predicates
    (openable ?r - receptacle)                                ; true if a receptacle is openable
    (opened ?r - receptacle)                                  ; true if a receptacle is opened
    (inReceptacle ?o - object ?r - object)                ; object ?o is in receptacle ?r
    (holds ?a - agent ?o - object)                            ; object ?o is held by agent ?a
    (holdsAny ?a - agent)                                     ; agent ?a holds an object
    (isClean ?o - object)                                     ; true if the object has been clean in sink
    (isHot ?o - object)                                       ; true if the object has been heated up
    (isCool ?o - object)                                      ; true if the object has been cooled
    (isOn ?o - object)                                        ; true if the object is on
    (isToggled ?o - object)                                   ; true if the object has been toggled
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
                (forall (?l - object)
                     (when (inReceptacle ?l ?lEnd) (atLocation ?a ?l)))
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
 (:action PickupObject
    :parameters (?a - agent ?o - object)
    :precondition (and
            (atLocation ?a ?o)
            (not (holdsAny ?a))
            )
    :effect (and
                (holds ?a ?o)
                (holdsAny ?a)
                (forall (?r - receptacle)
                    (not (inReceptacle ?o ?r))
                )
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
    :parameters (?a - agent ?r - sink ?o - object)
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
                (holds ?a ?ko)
            )
    :effect (and
                (isSliced ?co)
            )
 )


)