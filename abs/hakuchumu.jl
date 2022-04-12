function main()
    s = readline()
    while length(s) ≥ 5
        if endswith(s, "dream")
            s = s[1:end-5]
        elseif endswith(s, "dreamer")
            s = s[1:end-7]
        elseif endswith(s, "erase")
            s = s[1:end-5]
        elseif endswith(s, "eraser")
            s = s[1:end-6]
        else
            println("NO")
            return
        end
    end
    isempty(s) ? println("YES") : println("NO")
end

main()