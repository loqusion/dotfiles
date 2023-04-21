; extends
((fenced_code_block
   (info_string
     (language) @_language)
   (code_fence_content) @javascript)
 (#any-of? @_language "js" "node" "jsx"))

((fenced_code_block
   (info_string
     (language) @_language)
   (code_fence_content) @tsx)
 (#any-of? @_language "tsx" "typescriptreact"))
