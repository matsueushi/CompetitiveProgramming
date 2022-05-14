function solve(s)
    first(s) == 'A' || return false
    cs = 0
    for i in 2:length(s)
        if s[i] == 'C'
            3 ≤ i ≤ length(s) - 1 || return false
            cs += 1
        else
            'a' ≤ s[i] ≤ 'z' || return false
        end
    end
    cs == 1 || return false
    true
end

function main()
    s = readline()
    println(solve(s) ? "AC" : "WA")
end

main()
