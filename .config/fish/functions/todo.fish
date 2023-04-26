function todo --wraps=rg\ \'\(\(//\|\#\|--\|\<!--\|\;\|/\\\*\|^\)\\s\*\(TODO\|FIXME\|FIX\|BUG\|UGLY\|HACK\|NOTE\|IDEA\|REVIEW\|DEBUG\|OPTIMIZE\)\|^\\s\*-\ \\\[\ \\\]\)\' --description alias\ todo\ rg\ \'\(\(//\|\#\|--\|\<!--\|\;\|/\\\*\|^\)\\s\*\(TODO\|FIXME\|FIX\|BUG\|UGLY\|HACK\|NOTE\|IDEA\|REVIEW\|DEBUG\|OPTIMIZE\)\|^\\s\*-\ \\\[\ \\\]\)\'
  rg '((//|#|--|<!--|;|/\*|^)\s*(TODO|FIXME|FIX|BUG|UGLY|HACK|NOTE|IDEA|REVIEW|DEBUG|OPTIMIZE)|^\s*- \[ \])' $argv
        
end
