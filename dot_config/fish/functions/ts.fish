function ts
    if test (count $argv) -eq 0
        echo "Usage: ts <timestamp|\"YYYY-MM-DD [HH[:MM[:SS]]]\">"
        return 1
    end

    set input $argv[1]

    if string match -qr '^[0-9]+$' $input
        set result (date -r $input "+%Y-%m-%d %H:%M:%S")
    else
        set parts (string split ' ' $input)
        set date_part $parts[1]

        if test (count $parts) -gt 1
            set time_part $parts[2]
            set time_parts (string split ':' $time_part)
            set hh $time_parts[1]
            set mm (test (count $time_parts) -ge 2; and echo $time_parts[2]; or echo "00")
            set ss (test (count $time_parts) -ge 3; and echo $time_parts[3]; or echo "00")
        else
            set hh 00
            set mm 00
            set ss 00
        end

        set result (date -j -f "%Y-%m-%d %H:%M:%S" "$date_part $hh:$mm:$ss" "+%s")
    end

    echo $result
    echo -n $result | pbcopy
end
