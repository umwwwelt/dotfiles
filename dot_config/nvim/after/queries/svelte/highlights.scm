;; extends
(element
  (start_tag
    (tag_name) @component
    (#match? @component "^[A-Z]")))

(element
  (self_closing_tag
    (tag_name) @component
    (#match? @component "^[A-Z]")))

(end_tag
 (tag_name) @component
 (#match? @component "^[A-Z]"))

; ((raw_text) @runes (#any-of? @runes "$derived" "$effect" "$props"))
