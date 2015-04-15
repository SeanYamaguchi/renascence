; STUDENT は1964年にDaniel Bobrowによって書かれた、食の言語理解プログラム


; 方程式に分解末于
; 分解してついにして = を左辺部　右辺部に置く
; 合計や積などに分解し最終的に数変数を使用して最低水準になるまで落とす
; 英語の句を数式に変換する　ELIZA用に開発したルールベーストランスレータのアイディアをしよう
; 道の変数の値を求めるために結果として生成された数学の方程式を解く。
; 全ての変数の値を出力する

(defstruct (rule (:type list)) pattern response)

(defstruct (exp (:type list)
	(:constructor mkexp (lhs op rhs)))
op lhs rhs)

(defun exp-p (x) (consp x))
(defun exp-arg (x) (rest x))

(pat-match-abbenv `?x* `(?* ?x))

; ElIZA の問題記述としよう記述
(defun simple-equal (x y)
	"Are x and y equal ? (Don't check (Don't check inside strings.)"
		(if (or (atom x) (atom y))
			(eql x y)
			(and (simple-equal (first x) (first y))
				(simple-equal (rest x)(rest y)))))

(defun simple-equal (x y)
	"Are x and y equal / (Don't check inside strings."
		(if (or (atom x) (atom y))
			(eql x y)
			(and (simple-equal (first x)(first y))
				(simple-equal (rest x) (rest y)))))

(defun pat-match (pattern input)
	"Does pattern match input ? Any variable can match anything."
	(if (variable-p pattern)
		t
		(if (or (atom pattern) (atom input))
			(eql x y)
			(and (pat-match (first pattern) (first input))
				(pat-match (rest pattern) (rest input))))))

(defun variable-p (x)
	"Is x a variable (a symbol beginning with `?')?"
	(and (symbolp x) (equal (char (symbol-name) 0) #\?)))

(defun pat-match(pattern input)
	"Does pattern match input? WARNING: buggy version."
	(if (variable-p pattern)
		(list (cons pattern input))
		(if (or (atom pattern)(atom input))
			(eql pattern input
				(append (pat-match (first pattern)(first input))
					(pat-match (rest pattern)(rest input)))))))

(defconstant fail nil "Indicates pat-match failure")

(defconstant no-bilding `((t . t))
	"Indicates pat-match success, with no variables.")

(defun get-binding (var bindings)
	"Find a (variable . valuw) pait in a binding list."
	(assoc var bindings))

(defun lookup (var bindings)
	"Get the value part (for var) from a binding list."
	(binding-val (get-binding var bindings)))

(defun extend-bindings (var val bindings)
	"Add a (var . value) pair to a binding list."
	(cons (cons var val) bindings))

(defun pat-match (pattern input &optional (bindings no-bindings))
	"Match pattern against input in the context of the bindings"
	(cond ((eq binding fail) fail)
		((variable-p pattern)
			(match-variable pattern input bindings))
		((eql pattern input) bindings)
		((and (consp pattern) (consp input))
			(pat-match (rest pattern) (rest input)
				(pat-match (first pattern)(first input)
					bndings)))
					(t fail)))

(defun extend-bindings (var val bindings)
	"Add a (var . value) pair to a binding list."
	(cons (cons var val)
		;; 一度実の束縛をして
		;; no-bindings の替え玉を取り除く
		（if (bindings no-bindings)
		bindings))

(sublis (pat-match `(i need a ?X) `(i need a vacation))
	`(what would it mean to you if you get a ?X ?))

;; 5.3  セグメントパターンマッチング

(defun pat-match (pattern input &optional (bindings no-bindings))
	"Match pattern against input in the context of the bindings"
	(cond ((eq bindings fail) fail)
		((variable-p pattern)
			(match-variable pattern input bindings))
		((eql pattern input) bindings))
	((and (consp pattern) (consp input))
		(pat-match (rest pattern) (rest input)
			(pat-match (first pattern) (first input)
				bindings))))


(defun pat-match (pattern input &optional (bindings no-bindings))
	"Match pattern against input in the context of the bindings"
	(cond ((eq bindings fail) fail)
		((variable-p pattern)
			(match-variable pattern input bindings))
		((eql pattern input) bindings)
		((segment-pattern-p pattern)
			(segment-pattern-p pattern)
			(segment-match pattern input bindings))
		((and (consp pattern)(consp input))
			(pat-match (rest pattern)(rest input)
				(pat-match (first pattern)(first input)
					bindings)))
		(t fail)))

(defun segment-pattern-p (pattern)
	"Is this a segment matching pattern: ((?* var) . pat)"
	(and (consp pattern)
		(starts-with (first pattern) `?*)))

(defun segment-match (pattern input bindings &optional (start 0))
	"Match the segment pattern ((?* var) . pat) against input."
	(let ((var (second (first pattern)))
		(pat (rest pattern)))
	(if (null pat)
		(match-variable var input bindings)
		;; pat 定数で始まると仮定する
		;; パターンは連続する二つの変数を持てない
		(let ((pos (position (first pat) input
			:start start :test #'equal)))
		(if (null pos)
			fail
			(let ((b2 (pat-match pat (subseq input pos) bindings)))
				;; このマッチが失敗すれば、長くして試す
				;; さも無ければ、変数と入力のマッチを検査
				(if (wq b2 fail)
					(segment-match pattern input bindings (+ pos 1))
					(match-variable var (subseq input 0 pos)))))))))

;; ELIZAのプログラム　ルールベーストランスレータ

(defunparameter *eliza-rules*
	`((((?* ?X) hello (?* ?y))
		(How do you do. Please state your problem.))
	(((?* ?X) I want (?* ?y))
		(What would it mean if you goy ?y)
		(Why do you want ?y))
	(Suppose you got ?y soon))
	(((?* ?x) if (?* ?y))
		(Do you really think its likely that ?y) (Do you wish that ?y)
		(What do you think about ?y) (Really-- if ?y))
	((())))

(defun eliza ()
	"Respond to user input using pattern matching rules."
	(loop 
		(print `eliza>)
		(write (flatten (use-eliza-rules (read))) :pretty t)))

(defun user-eliza-rules (input)
	"Find some rule wit hwhich to transform the input."
	(come #'(lambda (rule)
		(let ((result (pat-match (rule-pattern rule) input)))
			(if (not (eq result fail))
				(sublis (switch-viewpoint result)
					(random-elt (rule-responses rule))))))
	*eliza-rules*))

(defun switch-viewpoint (words)
	"Change I to you and vice versa, and so on."
	(sublis `((I . you) (you . I) (me . you) (am . are))
		words))

(defun flatten (the-list)
	"Append together elements (or lists) in the list."
	(mappend #'mklist the-list))

(defun mklist (x)
	"Return x if it is a list, otherwise (x)."
	(if (listp x)
		x
		(list x)))

