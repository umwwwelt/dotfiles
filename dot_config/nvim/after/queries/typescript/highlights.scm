;; extends

(call_expression 
  function: (identifier) @runes (#any-of? @runes "$derived" "$effect" "$props"))

(call_expression
  function: (identifier) @fetch (#any-of? @fetch "fetch"))
