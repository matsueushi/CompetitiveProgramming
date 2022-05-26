parseint() = parse(Int, readline())

function solve(s, k)
    for i in 1:k
        s[i] != '1' && return s[i]
    end
    '1'
end

function main()
    s = readline()
    k = parseint()
    println(solve(s, k))
end

main()
