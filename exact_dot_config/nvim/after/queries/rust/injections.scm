; extends

; Highlight SQL in `sqlx::query!()`, `sqlx::query_scalar!()`, and `sqlx::query_scalar_unchecked!()`
; https://github.com/helix-editor/helix/blob/cbbeca6c5227e65bebdbe9abbadbd2202ffc1005/runtime/queries/rust/injections.scm
; NOTE: This works, but only momentarily as it is overriden after the LSP loads.
; (macro_invocation
;   macro: (scoped_identifier
;     path: (identifier) @_sqlx (#eq? @_sqlx "sqlx")
;     name: (identifier) @_query (#match? @_query "^query(_scalar|_scalar_unchecked)?$"))
;   (token_tree
;     ; Only the first argument is SQL
;     .
;     [
;       (string_literal (string_content) @injection.content)
;       (raw_string_literal (string_content) @injection.content)
;     ]
;   )
;   (#set! injection.language "sql"))
;   ; (#set! injection.include-children))

; Highlight SQL in `sqlx::query_as!()` and `sqlx::query_as_unchecked!()`
; (macro_invocation
;   macro: (scoped_identifier
;     path: (identifier) @_sqlx (#eq? @_sqlx "sqlx")
;     name: (identifier) @_query_as (#match? @_query_as "^query_as(_unchecked)?$"))
;   (token_tree
;     ; Only the second argument is SQL
;     .
;     ; Allow anything as the first argument in case the user has lower case type
;     ; names for some reason
;     (_)
;     [
;       (string_literal (string_content) @injection.content)
;       (raw_string_literal (string_content) @injection.content)
;     ]
;   )
;   (#set! injection.language "sql"))
;   ; (#set! injection.include-children))

; Debug injection - set string_literal as injection content with offset
; ((block_comment) @_comment (#eq? @_comment "/* sql */")
;  (string_literal) @injection.content
;  (#set! injection.language "sql")
;  (#set! injection.include-children)
;  (#offset! @injection.content 0 1 0 -1))

; Debug injection - set string_content as injection content
; ((block_comment) @_comment (#eq? @_comment "/* sql */")
;  (string_literal (string_content) @injection.content)
;  (#set! injection.language "sql")
;  (#set! injection.include-children))
