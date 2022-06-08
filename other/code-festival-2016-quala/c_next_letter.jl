parseint() = parse(Int, readline())

function solve(s, k)
    ss = Vector{Char}(s)
    for i in 1:length(ss)
        d = ('z' - ss[i] + 1) % 26
        if d ≤ k
            ss[i] = 'a'
            k -= d
        end
        if i == length(ss)
            ss[i] = 'a' + ((ss[i] - 'a') + k) % 26
        end
    end
    join(ss)
end

function main()
    s = readline()
    k = parseint()
    println(solve(s, k))
end

main()
