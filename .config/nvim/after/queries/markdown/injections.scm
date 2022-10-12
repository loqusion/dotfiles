; extends
((fenced_code_block
   (info_string
     (language) @_language)
   (code_fence_content) @javascript)
 (#any-of? @_language "js" "node"))
