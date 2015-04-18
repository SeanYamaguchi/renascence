;; 写像

(accumulate append
	nil
	(map (lambda (i)
		(map (lambda (j) (list i j))
			(enumerate-interval 1 (- i 1))))
	(enumerate-interval i n)))

(define (slatmap proc seq)
	(accumulate append nil (map proc seq)))

(define (prime-sum? pair)
	(prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
	(list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


(define (make-pair-sum pair)
	(car pair) (cadr pair) (+ (car pair) (cadr pair)))

(define (prime-sum-pairs n)
	(map make-pair-sum
		(filter prime-sum?
			(flatmap
				(lambda (i)
					(map (lambda (j) (list i j))
						(enumerate-interval 1 (- i 1))))
				(enumerate-interval i n)))))

(define (permutations s)
	(if (null? s)
		(list nil)
		(flatmap (lambda (x)
			(map (lambda (p) (cons x p))
				(permutations (remove x s))))
		s)))

(define (remove item sequence)
	(filter (lambda (x) (not (= x item))
		sequence)))

(frame-coord-map)

((frame-coord-map a-frame) (make-vect 0 0))

(origin-frame a-frame)

(define (xcor-vect ))

(define (ycor-vect ))

(define (make-frame origin edge1 edge2)
	(list origin edge1  edge2))

(define (segment->painter segment-list)
	(lambda (frame)
		(for-each
			(lambda (segment)
				(draw-line
					((frame-coord-map frame) (start-segment segment))
					((frame-coord-map frame) (end-segment segment))
					segment list)))))

(define (transform-painter painter origin corner1 corner2)
	(lambda (frame)
		(let ((m (frame-coord-map frame)))
			(let ((new-origin (m origin)))
				(painter
					(make-frame new-origin
						(sub-vect (m corner1) new-origin)
						(sub-vect (m corner2) new-origin)))))))

(define (flip-vect painter)
	(transform-painter painter
		(make-vect 0.0 1.0)
		(make-vect 1.0 1.0)
		(make-vect 0.0 0.0)))

(define (shrink-to-upper-right painter)
	(transform-painter painter
		(make-vect 0.5 0.5)
		(make-vect 1.0 0.5)
		(make-vect 0.5 1.0)))

(define (rotate90 painter)
	(transform-painter painter
		(make-vect 1.0 0.0)
		(make-vect 1.0 1.0)
		(make-vect 0.0 0.0)))

