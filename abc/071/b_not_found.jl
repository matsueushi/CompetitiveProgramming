function solve(s)
    for i in 0:25
        c = 'a' + i
        c ∈ s || return c
    end
    "None"
end

function main()
    s = readline()
    println(solve(s))
end

main()
